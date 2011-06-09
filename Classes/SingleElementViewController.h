//
//  SingleElementViewController.h
//  Period
//
//  Created by Christian Knappskog on 08.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PElement.h"


@interface SingleElementViewController : UIViewController {
    PElement *element;
    UILabel *abbreviation;
    UILabel *name;
    UILabel *number;
    UILabel *weight;
    UILabel *charge;
}

@property (nonatomic, retain) IBOutlet PElement *element;
@property (nonatomic, retain) IBOutlet UILabel *abbreviation;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *number;
@property (nonatomic, retain) IBOutlet UILabel *weight;
@property (nonatomic, retain) IBOutlet UILabel *charge;

@end
