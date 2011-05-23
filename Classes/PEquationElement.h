#import <Foundation/Foundation.h>
#import "PElement.h"

@interface PEquationElement : NSObject {
    PElement* element;
    int count;
}

@property (nonatomic, retain) PElement* element;
@property (nonatomic, assign) int count;

+ (PEquationElement*) equationWithElement:(PElement*)element;
- (void) increaseCount;
- (BOOL)isEqualToElement:(PElement*)pelement;

@end
