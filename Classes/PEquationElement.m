#import "PEquationElement.h"


@implementation PEquationElement

@synthesize element, count;

- (id) init
{
	self = [super init];
    count = 1;
	return self;
}

+ (PEquationElement*) equationWithElement:(PElement*)element{
    PEquationElement* eq = [[PEquationElement alloc] init];
    [eq setElement:element];
    [eq autorelease];
    return eq;
}

- (void) increaseCount{
    count++;
}

- (BOOL)isEqualToElement:(PElement*)pelement{
    return [[[self element] name] isEqualToString:[pelement name]];
}
@end
