#import "PEquation.h"


@implementation PEquation

@synthesize equationList;

- (id) init 
{
	self = [super init];
	self.equationList = [[NSMutableArray alloc] init];
	return self;
}

- (PEquationElement* )findExistingElement:(PElement*)element{
    for (PEquationElement* localElement in equationList){
        if ([localElement isEqualToElement:element]){
            return localElement;
        }
    }
    return NULL;
}

- (void)addElement:(PElement*)element{
    PEquationElement* pelement = [self findExistingElement:element];
    if (pelement != NULL){
        [pelement increaseCount];
    } else {
        PEquationElement* eq = [PEquationElement equationWithElement:element];
        [equationList addObject:eq];    
    }
}

- (NSString *) equation{
	NSMutableString * theEquation = [NSMutableString string];
    
	for (PEquationElement * element in equationList) {
        if ([element count] == 1){
           [theEquation appendString: [[element element] abbreviation]]; 
        } else {
            [theEquation appendString: [[element element] abbreviation]];
            NSString* countString = [[NSString alloc] initWithFormat:@"<sub>%i</sub>", [element count]];
            [theEquation appendString: countString];
            [countString release];
        }
	}
    
	return theEquation;
}

- (float) weight{
    return [PElements sumWeightsOfElements:equationList];
}

@end
