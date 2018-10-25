//
//  UIColor+Crayola.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+Crayola.h"
#import "Crayola.h"

static NSDictionary *crayolaHash;

@implementation UIColor (Crayola)

/**
 * Respond to memory warnings.
 */
+ (void)initialize
{
    [super initialize];
    
    #if TARGET_OS_IPHONE
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearCrayolaHash) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    #endif
}

/**
 * Initializes the crayola hash (NSDictionary) if needed.
 *
 */
+ (void)initCrayolaHash
{
    if (!crayolaHash) {
        crayolaHash = CRAYOLA_HASH;
    }
}

/**
 * Clears the crayola hash (NSDictionary).
 *
 */
+ (void)clearCrayolaHash
{
    crayolaHash = nil;
}

/**
 * Returns a UIColor based on the specified Crayola crayon name.
 *
 * @param crayon - crayon name {NSString} (from: http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors)
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithCrayola:(id)crayon
{
    [self initCrayolaHash];
    return [crayolaHash objectForKey:[[crayon lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""]];
}

@end
