#import "GestureRecognizerViewController.h"


@implementation GestureRecognizerViewController

@synthesize swipeLeftRecognizer, imageView;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
    /*
     Create and configure the four recognizers. Add each to the view as a gesture recognizer.
     */
	UIGestureRecognizer *recognizer;
	
    /*
     Create a swipe gesture recognizer to recognize right swipes (the default).
     We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
     */
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];
	
        /*
     Create an image view to display the gesture description.
     */
    UIImageView *anImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 75.0)];
    anImageView.contentMode = UIViewContentModeCenter;
    self.imageView = anImageView;
    [anImageView release];
    [self.view addSubview:imageView];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
	self.swipeLeftRecognizer = nil;
	self.imageView = nil;
}

- (IBAction)takeLeftSwipeRecognitionEnabledFrom:(UISegmentedControl *)aSegmentedControl {

    /*
     Add or remove the left swipe recogniser to or from the view depending on the selection in the segmented control.
     */
    if ([aSegmentedControl selectedSegmentIndex] == 0) {
        [self.view addGestureRecognizer:swipeLeftRecognizer];
    }
    else {
        [self.view removeGestureRecognizer:swipeLeftRecognizer];
    }
}

#pragma mark -
#pragma mark Responding to gestures

- (void)showImageWithText:(NSString *)string atPoint:(CGPoint)centerPoint {
	
    /*
     Set the appropriate image for the image view, move the image view to the given point, then dispay it by setting its alpha to 1.0.
     */
	NSString *imageName = [string stringByAppendingString:@".png"];
	imageView.image = [UIImage imageNamed:imageName];
	imageView.center = centerPoint;
	imageView.alpha = 1.0;	
}

/*
 In response to a swipe gesture, show the image view appropriately then move the image view in the direction of the swipe as it fades out.
 */
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {

	CGPoint location = [recognizer locationInView:self.view];
	[self showImageWithText:@"swipe" atPoint:location];
	
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        location.x -= 220.0;
    }
    else {
        location.x += 220.0;
    }
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.55];
	imageView.alpha = 0.0;
	imageView.center = location;
	[UIView commitAnimations];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[swipeLeftRecognizer release];
	[imageView release];
    [super dealloc];
}

@end
