#import <UIKit/UIKit.h>

@interface GestureRecognizerViewController : UIViewController <UIGestureRecognizerDelegate> {
	UISwipeGestureRecognizer *swipeLeftRecognizer;
	UIImageView *imageView;
}

@property (nonatomic, retain) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, retain) UIImageView *imageView;

@end

