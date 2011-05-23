#import "PeriodAppDelegate.h"
#import "RootViewController.h"


@implementation PeriodAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize toolbar;
@synthesize elements;
@synthesize equationLabel;
@synthesize myEquation;
@synthesize cancelButton;
@synthesize webView;

#pragma mark -
#pragma mark Application lifecycle

- (void)addAndCalculateEquation:(PElement*) element{
    [[self myEquation] addElement:element];
    [self updateMoleculeLabel];
}

-(void)updateMoleculeLabel
{
    NSString* equationString = [[NSString alloc] initWithFormat: @"<html><body style='background-color: transparent;color:white;font-weight:bold;font-family:helvetica;text-align:center;text-shadow: 0px -1px 1px rgba(0,0,0,0.7);'>%@</body></html>", [myEquation equation]];
    [[self webView] loadHTMLString: equationString baseURL:nil];    
    [equationString release];
    [[self cancelButton] setEnabled:YES];
    [[[[[[self navigationController] viewControllers] objectAtIndex:0] navigationItem] rightBarButtonItem] setEnabled:YES];
}

- (IBAction)calculateResults
{
	CalculationViewController * controller = [[CalculationViewController alloc] initWithNibName:@"CalculationViewController" bundle:nil];
	
	[controller setCalculatedResults:myEquation];

	[[self navigationController] pushViewController:controller animated:YES];
	[controller release]; controller = nil;
}

- (IBAction)resetCalculation
{
    [self setMyEquation: nil];
    [self setMyEquation:[[PEquation alloc] init]];
    [[self webView] loadHTMLString: @"<html><body style='background-color: transparent;color:white;font-weight:bold;font-family:helvetica;text-align:center;text-shadow: 0px -1px 1px rgba(0,0,0,0.7);'>Choose your elements</body></html>" baseURL:nil];    

    [[self cancelButton] setEnabled:NO];
    [[[[[[self navigationController] viewControllers] objectAtIndex:0] navigationItem] rightBarButtonItem] setEnabled:NO];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	self.elements = [[PElements alloc] init];
    [self setMyEquation:[[PEquation alloc] init]];
    
    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    [self.window addSubview:toolbar];
    
    for (id subview in webView.subviews)
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
            ((UIScrollView *)subview).bounces = NO;
    
    [[self webView] setOpaque: NO];
    [[self webView] setBackgroundColor: [UIColor clearColor]];
    [[self webView] loadHTMLString: @"<html><body style='background-color: transparent;color:white;font-weight:bold;font-family:helvetica;text-align:center;text-shadow: 0px -1px 1px rgba(0,0,0,0.7);'>Choose your elements</body></html>" baseURL:nil];    
    [[self cancelButton] setEnabled:NO];
    [[[[[[self navigationController] viewControllers] objectAtIndex:0] navigationItem] rightBarButtonItem] setEnabled:NO];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	self.elements = nil;
	[navigationController release];
    [toolbar release];
	[window release];
	[super dealloc];
}


@end

