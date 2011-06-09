#import "RootViewController.h"
#import "NSArray+Indexing.h"
@interface RootViewController()
@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@end


@implementation RootViewController

@synthesize indexedObjects;
@synthesize filteredListContent;
@synthesize collation;
@synthesize tvCell;

- (void)viewDidLoad
{	
	self.title = @"Elements";
	self.collation = [UILocalizedIndexedCollation currentCollation];
	PeriodAppDelegate* delegate = [(PeriodAppDelegate*)[[UIApplication sharedApplication] delegate] retain];
	PElements *elements = [[delegate elements] retain];
	self.indexedObjects = [[elements elements] indexUsingCollation:collation withSelector:@selector(abbreviation)];
    self.filteredListContent = [[NSMutableArray alloc] init];
    
	[delegate release];
	[elements release];
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return 1;
    }
	else
	{
        return [[collation sectionTitles] count];
    }  

}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.filteredListContent count];
    }
	else
	{
      	return [[indexedObjects objectAtIndex:section] count];	
    }  
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *MyIdentifier = @"ElementCell";
	
    ElementCell *cell = (ElementCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"ElementTableCell" owner:self options:nil];
        cell = tvCell;
        UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
        gesture.direction = UISwipeGestureRecognizerDirectionRight;
        [cell.contentView addGestureRecognizer:gesture];
        [gesture release];
        self.tvCell = nil;
    }

    NSArray *elements;	
    PElement *element;    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        element = [self.filteredListContent objectAtIndex:indexPath.row];
        NSLog(@"Cell Hit: %@", element);
    }
	else
	{
        elements = [indexedObjects objectAtIndex:indexPath.section];
        element = [elements objectAtIndex:indexPath.row];
    }
	cell.element = element;
	
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return @"";
    } else {
        return [[collation sectionTitles] objectAtIndex:section];
    }
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [collation sectionForSectionIndexTitleAtIndex:index];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return [[[NSArray alloc] init] autorelease];
    } else {
        return [collation sectionIndexTitles];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *elements;	
	PElement *element;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        element = [filteredListContent objectAtIndex:indexPath.row];
    }
	else
	{
        elements = [indexedObjects objectAtIndex:indexPath.section];
        element = [elements objectAtIndex:indexPath.row];
    }
			
	PeriodAppDelegate* delegate = (PeriodAppDelegate*)[[UIApplication sharedApplication] delegate];
    [delegate addAndCalculateEquation:element];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText
{
    [self.filteredListContent removeAllObjects]; // First clear the filtered array.
    
    PeriodAppDelegate* delegate = (PeriodAppDelegate*)[[UIApplication sharedApplication] delegate];
	PElements *elements = [delegate elements];
    
    for (PElement *element in [elements elements]){
		NSComparisonResult resultName = [element.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        NSComparisonResult resultAbbreviation = [element.abbreviation compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        
        if (resultName == NSOrderedSame || resultAbbreviation == NSOrderedSame)
		{
			[self.filteredListContent addObject:element];
        }
    }
}

-(void)didSwipe:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint swipeLocation = [gestureRecognizer locationInView:self.tableView];
        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
        ElementCell* swipedCell = (ElementCell*)[self.tableView cellForRowAtIndexPath:swipedIndexPath];
        [self showElementDetailsForElement: swipedCell.element];
    }
}

- (void)showElementDetailsForElement: (PElement*) element
{
	SingleElementViewController * controller = [[SingleElementViewController alloc] initWithNibName:@"SingleElementView" bundle:nil];
	
	[controller setElement:element];
    
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release]; controller = nil;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	self.indexedObjects = nil;
	self.collation = nil;
    [super dealloc];
}


@end

