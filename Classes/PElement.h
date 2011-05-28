#import <Foundation/Foundation.h>


@interface PElement : NSObject {
	NSString* name;
	NSString* abbreviation;
	double weight;
	int number;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *abbreviation;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) int number;

+ (PElement*) elementWithName:(NSString*)name number: (int)number abbreviation:(NSString*)abbreviation	andWeight:(double)weight;

+ (PElement*) elementWithNumber:        (int)number   
                    abbreviation:       (NSString*)abbreviation   
                    groupNumber:        (int)groupNumber   
                    groupName:          (NSString*)groupName
                    period:             (int)period 
                    name:               (NSString*)name      
                    roundedMass:        (float)roundedMass      
                    mass:               (double)weight    
                    meltingPoint:       (double)meltingPoint 
                    boilingPoint:       (double)boilingPoint 
                    density:            (double)density
                    electroNegativity:  (double)electroNegativity 
                    firstIonisation:    (int)firstIonisation 
                    electronAffinity:   (int)electronAffinity  
                    commonOxidation:    (NSString*)commonOxidation 		    
                    predictedConfiguration: (NSString*)predictedConfiguration
                    observedConfiguration:  (NSString*)observedConfiguration;     

- (NSComparisonResult)compare:(id)otherObject;

@end
