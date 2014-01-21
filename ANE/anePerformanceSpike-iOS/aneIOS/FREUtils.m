//
//  FREUtils.m
//  CalendarANE
//
//  Created by Henrik Akesson on 15/01/2014.
//  Copyright (c) 2014 akesson.mobi. All rights reserved.
//

#import "FREUtils.h"

@implementation FREUtils

+(NSString*) NSStringFromFREObject:(FREObject*) obj {
    uint32_t length;
    const uint8_t* cString;
    
    FREGetObjectAsUTF8(obj, &length, &cString);
    
    NSString *string = [NSString stringWithUTF8String:(char*)cString];
    return string;
}

+(uint32_t) UIntFromFREObject:(FREObject*) obj {
    unsigned int val;
    FREGetObjectAsUint32(obj, &val);
    return val;
}

+(BOOL) BoolFromFREObject:(FREObject*) obj {
    uint32_t val;
    FREGetObjectAsBool(obj, &val);
    return val;
}

+(int) IntFromFREObject:(FREObject*) obj {
    int32_t val;
    FREGetObjectAsInt32(obj, &val);
    return val;
}

+(double) DoubleFromFREObject:(FREObject*) obj {
    double val;
    FREGetObjectAsDouble(obj, &val);
    return val;
}

+(NSDate*) NSDateFromFREEpochSeconds:(FREObject*) obj {
    return [[NSDate alloc] initWithTimeIntervalSince1970:[self DoubleFromFREObject:obj]];
}

+(FREObject) FREObjectFromBool:(BOOL) val {
    FREObject obj;
    FRENewObjectFromBool(val, &obj);
    return obj;
}

+(FREObject) FREObjectFromUInt:(uint32_t) val {
    FREObject obj;
    FRENewObjectFromUint32(val, &obj);
    return obj;
}

+(FREObject) FREObjectFromInt:(int32_t) val {
    FREObject obj;
    FRENewObjectFromInt32(val, &obj);
    return obj;
}

+(FREObject) FREObjectFromDouble:(double) val {
    FREObject obj;
    FRENewObjectFromDouble(val, &obj);
    return obj;
}

+(FREObject) FREObjectFromNSString:(NSString*) val {
    if (!val) val = @"";
    const char* utf8 = [val UTF8String];
    FREObject obj;
    
    FRENewObjectFromUTF8((unsigned int) strlen(utf8), (const uint8_t*) utf8, &obj );
    
    return obj;
}

+(FREObject) FREObjectFromObject:(char*) className {
    FREObject obj;
    FRENewObject( (const uint8_t*)className, 0, NULL, &obj, NULL );
    return obj;
}

@end
