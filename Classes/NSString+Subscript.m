//
//  NSString+Subscript.m
//  Period
//
//  Created by Christian Knappskog on 28.05.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Subscript.h"

@implementation NSString (Subscript)

+ (NSString*) stringWithSubscriptNumber: (int) number{
    NSArray* numberArray = [NSArray arrayWithObjects:@"₀", @"₁", @"₂", @"₃", @"₄", @"₅", @"₆", @"₇", @"₈", @"₉", nil];
    if (number > 0 && number < 10){
        return [numberArray objectAtIndex:number];
    } else if (number > 9 && number < 100) {
        int i = number % 10;
        int y = (number - i) / 10;
        return [[numberArray objectAtIndex:y] stringByAppendingString:[numberArray objectAtIndex:i]];
    }
    return @"e";
}

@end
