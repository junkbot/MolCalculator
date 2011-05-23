#import "ElementCell.h"

@implementation ElementCell

@synthesize name;
@synthesize abbreviation;
@synthesize weight;
@synthesize number;
@synthesize addElementButton;
@synthesize element;

- (void) setElement:(PElement *) newElement
{
	if (newElement != nil){
		[newElement retain];
		[element release];
		element = newElement;
		[[self name] setText: [self.element name]];
		[[self abbreviation] setText: [self.element abbreviation]];
		[[self weight] setText: [NSString stringWithFormat:@"%1.2f", self.element.weight]];
        [[self number] setText: [NSString stringWithFormat:@"%d", [element number]]];
	} else {
		[element release];
		element = nil;
	}
}

@end
