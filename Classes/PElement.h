#import <Foundation/Foundation.h>


@interface PElement : NSObject {
	NSString* name;
	NSString* abbreviation;
	double weight;
	int number;
    int groupNumber;   
    NSString* groupName;
    int period; 
    float roundedMass;          
    double meltingPoint; 
    double boilingPoint; 
    double density;
    double electroNegativity; 
    int firstIonisation;
    int electronAffinity;  
    NSString* commonOxidation;
    NSString* predictedConfiguration;
    NSString* observedConfiguration;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *abbreviation;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) int number;
@property (nonatomic, assign) int groupNumber;   
@property (nonatomic, retain) NSString* groupName;
@property (nonatomic, assign) int period; 
@property (nonatomic, assign) float roundedMass;          
@property (nonatomic, assign) double meltingPoint; 
@property (nonatomic, assign) double boilingPoint; 
@property (nonatomic, assign) double density;
@property (nonatomic, assign) double electroNegativity; 
@property (nonatomic, assign) int firstIonisation;
@property (nonatomic, assign) int electronAffinity;  
@property (nonatomic, retain) NSString* commonOxidation;
@property (nonatomic, retain) NSString* predictedConfiguration;
@property (nonatomic, retain) NSString* observedConfiguration;

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
