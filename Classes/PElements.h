#import <Foundation/Foundation.h>
#import "PElement.h"
#import "PEquationElement.h"

@interface PElements : NSObject {
	NSMutableArray *elements;
}
@property (nonatomic, retain) NSMutableArray *elements;

+ (float) sumWeightsOfElements: (NSArray*) elementsToAdd;

@end
