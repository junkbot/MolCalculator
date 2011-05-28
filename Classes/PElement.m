#import "PElement.h"

@implementation PElement

@synthesize name;
@synthesize weight;
@synthesize abbreviation;
@synthesize number;
@synthesize groupNumber;   
@synthesize groupName;
@synthesize period; 
@synthesize roundedMass;          
@synthesize meltingPoint; 
@synthesize boilingPoint; 
@synthesize density;
@synthesize electroNegativity; 
@synthesize firstIonisation;
@synthesize electronAffinity;  
@synthesize commonOxidation;
@synthesize predictedConfiguration;
@synthesize observedConfiguration;

- (id) init
{
	self = [super init];
	return self;
}


- (NSComparisonResult)compare:(id)otherObject {
    return [self.name compare:[otherObject name]];
}

+ (PElement*) elementWithName:(NSString*)name number: (int)number abbreviation:(NSString*)abbreviation	andWeight:(double)weight
{
	PElement *element = [[PElement alloc] init];
	element.name = name;
	element.weight = weight;
	element.number = number;
	element.abbreviation = abbreviation;
    [element autorelease];
	return element;
}

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
          observedConfiguration:  (NSString*)observedConfiguration{
    
	PElement *element = [[PElement alloc] init];
	
    element.name = name;
	element.weight = weight;
	element.number = number;
	element.abbreviation = abbreviation;
    element.groupNumber = groupNumber;   
    element.groupName = groupName;
    element.period = period; 
    element.roundedMass = roundedMass;          
    element.meltingPoint = meltingPoint; 
    element.boilingPoint = boilingPoint; 
    element.density = density;
    element.electroNegativity = electroNegativity; 
    element.firstIonisation = firstIonisation;
    element.electronAffinity = electronAffinity;  
    element.commonOxidation = commonOxidation;
    element.predictedConfiguration = predictedConfiguration;
    element.observedConfiguration = observedConfiguration;
    
    [element autorelease];
	return element;
}

- (NSString*)description
{
    return [@"PElement: " stringByAppendingString:name];
}

- (void) dealloc
{
	self.name = nil;
	self.abbreviation = nil;
	self.weight = 0.0;
	self.number = 0;
	[super dealloc];
}

@end
