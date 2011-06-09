#import <UIKit/UIKit.h>
#import "PEquation.h"

@interface CalculationViewController : UIViewController {
	UILabel * equation;
	UILabel * weight;
	PEquation * calculatedResults;
}

@property (nonatomic, retain) IBOutlet UILabel * equation;
@property (nonatomic, retain) IBOutlet UILabel * weight;
@property (nonatomic, retain) PEquation * calculatedResults;

@end
