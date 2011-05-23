#import <Foundation/Foundation.h>


@interface PElement : NSObject {
	NSString* name;
	NSString* abbreviation;
	float weight;
	int number;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *abbreviation;
@property (nonatomic, assign) float weight;
@property (nonatomic, assign) int number;

+ (PElement*) elementWithName:(NSString*)name number: (int)number abbreviation:(NSString*)abbreviation	andWeight:(float)weight;

- (NSComparisonResult)compare:(id)otherObject;

@end
