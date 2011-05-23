#import <UIKit/UIKit.h>
#import "PEquation.h"

@interface CalculationViewController : UIViewController {
	UIWebView * equation;
	UILabel * weight;
	PEquation * calculatedResults;
}

@property (nonatomic, retain) IBOutlet UIWebView * equation;
@property (nonatomic, retain) IBOutlet UILabel * weight;
@property (nonatomic, retain) PEquation * calculatedResults;

@end
