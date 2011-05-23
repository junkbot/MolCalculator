#import "PElements.h"


@interface PElements ()

- (NSMutableArray*) loadElements;

@end


@implementation PElements

@synthesize elements;

- (id) init 
{
	self = [super init];
	self.elements = [self loadElements];
	return self;
}

+ (float) sumWeightsOfElements: (NSArray*) elementsToAdd
{
	[elementsToAdd retain];
	float weight = 0.0;
	for (PEquationElement* element in elementsToAdd) {
        float elementWeight = [element count] * [[element element] weight];
		weight += elementWeight;
	}
	[elementsToAdd release];
	return weight;
}

- (NSMutableArray*) loadElements
{
	return [NSMutableArray arrayWithObjects:
							[PElement elementWithName:@"Actinium" number: 89	abbreviation:@"Ac"	andWeight:227.03],
							[PElement elementWithName:@"Silver" number: 47	abbreviation:@"Ag"	andWeight:107.87],
							[PElement elementWithName:@"Aluminum" number: 13	abbreviation:@"Al"	andWeight:26.98],
							[PElement elementWithName:@"Americium" number:	95	abbreviation:@"Am"	andWeight:243.06],
							[PElement elementWithName:@"Argon" number: 18	abbreviation:@"Ar"	andWeight:39.95],
							[PElement elementWithName:@"Arsenic" number: 33	abbreviation:@"As"	andWeight:74.99],
							[PElement elementWithName:@"Astatine" number: 85	abbreviation:@"At"	andWeight:209.99],
							[PElement elementWithName:@"Gold" number: 79	abbreviation:@"Au"	andWeight:196.97],
							[PElement elementWithName:@"Boron" number: 5	  abbreviation:@"B"  andWeight:10.81],
							[PElement elementWithName:@"Barium" number: 56	abbreviation:@"Ba"	andWeight:137.34],
							[PElement elementWithName:@"Beryllium"	number: 4	  abbreviation:@"Be"	andWeight:9.01],
							[PElement elementWithName:@"Bismuth" number: 83	abbreviation:@"Bi"	andWeight:208.98],
							[PElement elementWithName:@"Berkelium"	number: 97	abbreviation:@"Bk"	andWeight:247.07],
							[PElement elementWithName:@"Bromine" number: 35	abbreviation:@"Br"	andWeight:79.91	],
			[PElement elementWithName:@"Carbon" number: 6	  abbreviation:@"C" andWeight:  12.01 ],
			[PElement elementWithName:@"Calcium" number: 20  abbreviation:@"Ca" andWeight: 40.08  ],
			[PElement elementWithName:@"Cadmium" number: 48  abbreviation:@"Cd" andWeight: 112.40 ],
			[PElement elementWithName:@"Cerium" number: 58  abbreviation:@"Ce" andWeight: 140.12 ],
			[PElement elementWithName:@"Californium" number: 98  abbreviation:@"Cf" andWeight: 251.08 ],
			[PElement elementWithName:@"Chlorine" number: 17  abbreviation:@"Cl" andWeight: 35.45  ],
			[PElement elementWithName:@"Curium" number: 96  abbreviation:@"Cm" andWeight: 247.07 ],
			[PElement elementWithName:@"Cobalt" number: 27  abbreviation:@"Co" andWeight: 58.93  ],
			[PElement elementWithName:@"Chromium" number: 24  abbreviation:@"Cr" andWeight: 52.00  ],
			[PElement elementWithName:@"Cesium" number: 55  abbreviation:@"Cs" andWeight: 132.90 ],
			[PElement elementWithName:@"Copper" number: 29  abbreviation:@"Cu" andWeight: 63.54  ],
			[PElement elementWithName:@"Dysprosium" number: 66  abbreviation:@"Dy" andWeight: 162.50 ],
			[PElement elementWithName:@"Erbium" number: 68  abbreviation:@"Er" andWeight: 167.26 ],
			[PElement elementWithName:@"Einsteinium" number: 99  abbreviation:@"Es" andWeight: 254.09 ],
			[PElement elementWithName:@"Europium" number: 63  abbreviation:@"Eu" andWeight: 151.96 ],
			[PElement elementWithName:@"Fluorine" number: 9	  abbreviation:@"F" andWeight:  19.00 ],
			[PElement elementWithName:@"Iron" number: 26  abbreviation:@"Fe" andWeight: 55.85  ],
			[PElement elementWithName:@"Fermium" number: 100	abbreviation:@"Fm" andWeight: 257.10 ],
			[PElement elementWithName:@"Francium" number: 87  abbreviation:@"Fr" andWeight: 223.02 ],
			[PElement elementWithName:@"Gallium" number: 31  abbreviation:@"Ga" andWeight: 69.72  ],
			[PElement elementWithName:@"Gadolinium" number: 64  abbreviation:@"Gd" andWeight: 157.25 ],
			[PElement elementWithName:@"Germanium" number: 32  abbreviation:@"Ge" andWeight: 72.59  ],
			[PElement elementWithName:@"Hydrogen" number: 1	  abbreviation:@"H" andWeight:  1.01  ],
			[PElement elementWithName:@"Helium" number: 2	  abbreviation:@"He" andWeight: 4.00   ],
			[PElement elementWithName:@"Hafnium" number: 72  abbreviation:@"Hf" andWeight: 178.49 ],
			[PElement elementWithName:@"Mercury" number: 80  abbreviation:@"Hg" andWeight: 200.59 ],
			[PElement elementWithName:@"Holmium" number: 67  abbreviation:@"Ho" andWeight: 164.93 ],
			[PElement elementWithName:@"Iodine" number: 53  abbreviation:@"I" andWeight:  126.90],
			[PElement elementWithName:@"Indium" number: 49  abbreviation:@"In" andWeight: 114.82 ],
			[PElement elementWithName:@"Iridium" number: 77  abbreviation:@"Ir" andWeight: 192.22 ],
			[PElement elementWithName:@"Potassium" number: 19  abbreviation:@"K" andWeight:  39.10 ],
			[PElement elementWithName:@"Krypton" number: 36  abbreviation:@"Kr" andWeight: 83.80  ],
			[PElement elementWithName:@"Lanthanum" number: 57  abbreviation:@"La" andWeight: 138.91 ],
			[PElement elementWithName:@"Lithium" number: 3	  abbreviation:@"Li" andWeight: 6.94   ],
			[PElement elementWithName:@"Lawrencium" number: 103	abbreviation:@"Lr" andWeight: 256.10 ],
			[PElement elementWithName:@"Lutetium" number: 71  abbreviation:@"Lu" andWeight: 174.97 ],
			[PElement elementWithName:@"Mendelevium" number: 101	abbreviation:@"Md" andWeight: 257.10 ],
			[PElement elementWithName:@"Magnesium" number: 12  abbreviation:@"Mg" andWeight: 24.31  ],
			[PElement elementWithName:@"Manganese" number: 25  abbreviation:@"Mn" andWeight: 54.94  ],
			[PElement elementWithName:@"Molybdenum" number: 42  abbreviation:@"Mo" andWeight: 95.94  ],
			[PElement elementWithName:@"Nitrogen" number: 7	  abbreviation:@"N" andWeight:  14.01 ],
			[PElement elementWithName:@"Sodium" number: 11  abbreviation:@"Na" andWeight: 22.99  ],
			[PElement elementWithName:@"Niobium" number: 41  abbreviation:@"Nb" andWeight: 92.91  ],
			[PElement elementWithName:@"Neodymium" number: 60  abbreviation:@"Nd" andWeight: 144.24 ],
			[PElement elementWithName:@"Neon" number: 10  abbreviation:@"Ne" andWeight: 20.18  ],
			[PElement elementWithName:@"Nickel" number: 28  abbreviation:@"Ni" andWeight: 58.71  ],
			[PElement elementWithName:@"Nobelium" number: 102	abbreviation:@"No" andWeight: 255.09 ],
			[PElement elementWithName:@"Neptunium" number: 93  abbreviation:@"Np" andWeight: 237.00 ],
			[PElement elementWithName:@"Oxygen" number: 8   abbreviation:@"O" andWeight:  16.00 ],
			[PElement elementWithName:@"Osmium" number: 76  abbreviation:@"Os" andWeight: 190.20 ],
			[PElement elementWithName:@"Phosphorus" number: 15  abbreviation:@"P" andWeight:  30.98 ],
			[PElement elementWithName:@"Protactinium" number: 91  abbreviation:@"Pa" andWeight: 231.04 ],
			[PElement elementWithName:@"Lead" number: 82  abbreviation:@"Pb" andWeight: 207.19 ],
			[PElement elementWithName:@"Palladium" number: 46  abbreviation:@"Pd" andWeight: 106.40 ],
			[PElement elementWithName:@"Promethium" number: 61  abbreviation:@"Pm" andWeight: 144.91 ],
			[PElement elementWithName:@"Polonium" number: 84  abbreviation:@"Po" andWeight: 208.98 ],
			[PElement elementWithName:@"Praseodymium" number: 59  abbreviation:@"Pr" andWeight: 140.91 ],
			[PElement elementWithName:@"Platinum" number: 78  abbreviation:@"Pt" andWeight: 195.09 ],
			[PElement elementWithName:@"Plutonium" number: 94  abbreviation:@"Pu" andWeight: 242.00 ],
			[PElement elementWithName:@"Radium" number: 88  abbreviation:@"Ra" andWeight: 226.00 ],
			[PElement elementWithName:@"Rubidium" number: 37  abbreviation:@"Rb" andWeight: 85.47  ],
			[PElement elementWithName:@"Rhenium" number: 75  abbreviation:@"Re" andWeight: 186.20 ],
			[PElement elementWithName:@"Rhodium" number: 45  abbreviation:@"Rh" andWeight: 102.90 ],
			[PElement elementWithName:@"Radon" number: 86  abbreviation:@"Rn" andWeight: 222.02 ],
			[PElement elementWithName:@"Ruthenium" number: 44  abbreviation:@"Ru" andWeight: 101.07 ],
			[PElement elementWithName:@"Sulfur" number: 16  abbreviation:@"S" andWeight:  32.06 ],
			[PElement elementWithName:@"Antimony" number: 51  abbreviation:@"Sb" andWeight: 121.75 ],
			[PElement elementWithName:@"Scandium" number: 21  abbreviation:@"Sc" andWeight: 44.96  ],
			[PElement elementWithName:@"Selenium" number: 34  abbreviation:@"Se" andWeight: 78.96  ],
			[PElement elementWithName:@"Silicon" number: 14  abbreviation:@"Si" andWeight: 28.09  ],
			[PElement elementWithName:@"Samarium" number: 62  abbreviation:@"Sm" andWeight: 150.35 ],
			[PElement elementWithName:@"Tin" number: 50  abbreviation:@"Sn" andWeight: 118.69 ],
			[PElement elementWithName:@"Strontium" number: 38  abbreviation:@"Sr" andWeight: 87.62  ],
			[PElement elementWithName:@"Tantalum" number: 73  abbreviation:@"Ta" andWeight: 180.95 ],
			[PElement elementWithName:@"Terbium" number: 65  abbreviation:@"Tb" andWeight: 158.92 ],
			[PElement elementWithName:@"Technetium" number: 43  abbreviation:@"Tc" andWeight: 96.91  ],
			[PElement elementWithName:@"Tellurium" number: 52  abbreviation:@"Te" andWeight: 127.60 ],
			[PElement elementWithName:@"Thorium" number: 90  abbreviation:@"Th" andWeight: 232.04 ],
			[PElement elementWithName:@"Titanium" number: 22  abbreviation:@"Ti" andWeight: 47.90  ],
			[PElement elementWithName:@"Thallium" number: 81  abbreviation:@"Tl" andWeight: 204.37 ],
			[PElement elementWithName:@"Thulium" number: 69  abbreviation:@"Tm" andWeight: 168.93 ],
			[PElement elementWithName:@"Uranium" number: 92  abbreviation:@"U" andWeight:  238.03],
			[PElement elementWithName:@"Vanadium" number: 23  abbreviation:@"V" andWeight:  50.94 ],
			[PElement elementWithName:@"Wolfram" number: 74  abbreviation:@"W" andWeight:  183.85],
			[PElement elementWithName:@"Xenon" number: 54  abbreviation:@"Xe" andWeight: 131.30 ],
			[PElement elementWithName:@"Yttrium" number: 39  abbreviation:@"Y" andWeight:  88.91 ],
			[PElement elementWithName:@"Ytterbium" number: 70  abbreviation:@"Yb" andWeight: 173.04 ],
			[PElement elementWithName:@"Zinc" number: 30  abbreviation:@"Zn" andWeight: 65.37  ],
			[PElement elementWithName:@"Zirconium" number: 40  abbreviation:@"Zr" andWeight: 91.22  ],
							nil];
}
- (void) dealloc
{
	self.elements = nil;
	[super dealloc];
}

@end
