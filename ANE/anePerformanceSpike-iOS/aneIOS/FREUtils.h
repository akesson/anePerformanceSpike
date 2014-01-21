//
//  FREUtils.h
//  CalendarANE
//
//  Created by Henrik Akesson on 15/01/2014.
//  Copyright (c) 2014 akesson.mobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface FREUtils : NSObject

+(BOOL) BoolFromFREObject:(FREObject*) obj;
+(uint32_t) UIntFromFREObject:(FREObject*) obj;
+(int32_t) IntFromFREObject:(FREObject*) obj;
+(double) DoubleFromFREObject:(FREObject*) obj;
+(NSString*) NSStringFromFREObject:(FREObject*) obj;
+(NSDate*) NSDateFromFREEpochSeconds:(FREObject*) obj;

+(FREObject) FREObjectFromBool:(BOOL) val;
+(FREObject) FREObjectFromUInt:(uint32_t) val;
+(FREObject) FREObjectFromInt:(int32_t) val;
+(FREObject) FREObjectFromDouble:(double) val;
+(FREObject) FREObjectFromNSString:(NSString*) val;
+(FREObject) FREObjectFromObject:(char*) className;

@end
