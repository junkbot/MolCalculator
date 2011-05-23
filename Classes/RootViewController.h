#import <UIKit/UIKit.h>
#import "PElement.h"
#import "PeriodAppDelegate.h"
#import "ElementCell.h"

@interface RootViewController : UITableViewController {
	NSArray *indexedObjects;
	NSArray *flatListOfElements;
    NSMutableArray *filteredListContent;
	ElementCell *tvCell;
}

@property (nonatomic, retain) NSArray *indexedObjects;
@property (nonatomic, retain) NSMutableArray *filteredListContent;
@property (nonatomic, assign) IBOutlet ElementCell *tvCell;

- (void)filterContentForSearchText:(NSString*)searchText;
@end
