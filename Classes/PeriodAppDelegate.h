#import <UIKit/UIKit.h>
#import "PElement.h"
#import "PElements.h"
#import "PEquation.h"
#import "CalculationViewController.h"


@interface PeriodAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
    UIBarButtonItem *cancelButton;
	PElements *elements;
    UILabel *equationLabel;
    UIToolbar *toolbar;
    PEquation *myEquation;
    UIBarButtonItem *webView;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *webView;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UILabel *equationLabel;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) PElements *elements;
@property (nonatomic, retain) PEquation *myEquation;

- (IBAction)calculateResults;
- (IBAction)resetCalculation;
- (void)updateMoleculeLabel;
- (void)addAndCalculateEquation:(PElement*) element;

@end

