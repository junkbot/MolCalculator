#import <Foundation/Foundation.h>
#import "PElement.h"
#import "PEquationElement.h"
#import "PElements.h"


@interface PEquation : NSObject {
    NSMutableArray* equationList;
}

@property (nonatomic, retain) NSMutableArray* equationList;

- (void)addElement:(PElement*)element;
- (NSString *) equation;
- (float) weight;
- (PEquationElement* )findExistingElement:(PElement*)element;

@end
