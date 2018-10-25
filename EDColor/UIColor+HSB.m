//
//  UIColor+HSB.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+HSB.h"

@implementation UIColor (HSB)

#pragma mark - Public

/**
 * Returns a UIColor that is offset from the current UIColor instance.
 *
 * @param hue - {CGFloat} offset (-1.0 to 1.0)
 * @param saturation - {CGFloat} offset (-1.0 to 1.0)
 * @param brightness - {CGFloat} offset (-1.0 to 1.0)
 * @param alpha - {CGFloat} offset (-1.0 to 1.0)
 *
 * @return {UIColor}
 */
- (UIColor *)offsetWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
    // Current values
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    
    // Calculate offsets
    hue         = fmodf(hue + h, 1.0f);
    saturation  = [self clamp:(saturation + s)];
    brightness  = [self clamp:(brightness + b)];
    alpha       = [self clamp:(alpha + a)];
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

#pragma mark - Private

/**
 * Ternary clamp (0.0f to 1.0f)
 *
 * @param input - {CGFloat}
 *
 * @return {CGFloat}
 */
- (CGFloat)clamp:(CGFloat)input
{
    static const CGFloat min = 0.0f;
    static const CGFloat max = 1.0f;
    
    return (input > max) ? max : ((input < min) ? min : input);
}

@end
