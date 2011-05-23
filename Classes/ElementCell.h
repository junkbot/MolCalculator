#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PElement.h"

@interface ElementCell : UITableViewCell {	
	IBOutlet UILabel *abbreviation;
	IBOutlet UILabel *name;
	IBOutlet UILabel *weight;
	IBOutlet UILabel *number;
	IBOutlet UIButton *addElementButton;
	PElement *element;
}

@property (nonatomic, retain) PElement *element;
@property (nonatomic, assign) IBOutlet UILabel *abbreviation;
@property (nonatomic, assign) IBOutlet UILabel *name;
@property (nonatomic, assign) IBOutlet UILabel *weight;
@property (nonatomic, assign) IBOutlet UILabel *number;
@property (nonatomic, assign) IBOutlet UIButton *addElementButton;

@end
