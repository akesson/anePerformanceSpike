//
//  aneIOS.m
//  aneIOS
//
//  Created by Henrik Akesson on 21/01/2014.
//  Copyright (c) 2014 serendipi. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import "FREUtils.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define MAP_FUNCTION(fn) { (const unsigned char*)(#fn), NULL, &(fn) }
#define FRE_SET_PROP(obj,prop,val) ( FRESetObjectProperty(obj, (const uint8_t*)prop, val, NULL) )

#define VECTOR_SIZE 100

int val = 0;

DEFINE_ANE_FUNCTION( run0Arg ) {
    val++;
    return NULL;
}

DEFINE_ANE_FUNCTION( run1Arg ) {
    val += [FREUtils IntFromFREObject:argv[0]];
    
    return NULL;
}

DEFINE_ANE_FUNCTION( run2Arg ) {
    val += [FREUtils IntFromFREObject:argv[0]];
    val += [FREUtils IntFromFREObject:argv[1]];
    
    return NULL;
}

DEFINE_ANE_FUNCTION( run3Arg ) {
    val += [FREUtils IntFromFREObject:argv[0]];
    val += [FREUtils IntFromFREObject:argv[1]];
    val += [FREUtils IntFromFREObject:argv[2]];
    
    return NULL;
}

DEFINE_ANE_FUNCTION( run4Arg ) {
    val += [FREUtils IntFromFREObject:argv[0]];
    val += [FREUtils IntFromFREObject:argv[1]];
    val += [FREUtils IntFromFREObject:argv[2]];
    val += [FREUtils IntFromFREObject:argv[3]];
    
    return NULL;
}

DEFINE_ANE_FUNCTION( run5Arg ) {
    val += [FREUtils IntFromFREObject:argv[0]];
    val += [FREUtils IntFromFREObject:argv[1]];
    val += [FREUtils IntFromFREObject:argv[2]];
    val += [FREUtils IntFromFREObject:argv[3]];
    val += [FREUtils IntFromFREObject:argv[4]];
    
    return NULL;
}

DEFINE_ANE_FUNCTION( returnBool ) {
    return [FREUtils FREObjectFromBool:TRUE];
}

DEFINE_ANE_FUNCTION( returnUInt ) {
    return [FREUtils FREObjectFromUInt:(uint32_t) val];
}

DEFINE_ANE_FUNCTION( returnInt ) {
    return [FREUtils FREObjectFromUInt:(uint32_t) val];
}

DEFINE_ANE_FUNCTION( returnDouble ) {
    return [FREUtils FREObjectFromDouble:(double) val];
}

DEFINE_ANE_FUNCTION( returnString ) {
    return [FREUtils FREObjectFromNSString:@""];
}

DEFINE_ANE_FUNCTION( returnVector ) {
    return [FREUtils FREObjectFromObject:"Vector.<sd.ane.calendar.Calendar>"];
}

DEFINE_ANE_FUNCTION( returnObject ) {
    return [FREUtils FREObjectFromObject:"co.serendipi.spike.ane.SimpleObject"];
}

DEFINE_ANE_FUNCTION( createBooleans ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<Boolean>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromBool:TRUE]);

    return NULL;
}

DEFINE_ANE_FUNCTION( createUInts ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<uint>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromUInt:(uint32_t) val]);

    return NULL;
}

DEFINE_ANE_FUNCTION( createInts ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<int>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromInt:val]);

    return NULL;
}

DEFINE_ANE_FUNCTION( createDoubles ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<Number>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromDouble:val]);

    return NULL;
}

DEFINE_ANE_FUNCTION( createStrings ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<String>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromNSString:@""]);
    
    return NULL;
}

DEFINE_ANE_FUNCTION( createObjects ) {
    FREObject vect = [FREUtils FREObjectFromObject:"Vector.<co.serendipi.spike.ane.SimpleObject>"];
    
    for (int i = 0; i < VECTOR_SIZE; i++)
        FRESetArrayElementAt(vect, i, [FREUtils FREObjectFromObject:"co.serendipi.spike.ane.SimpleObject"] );

    return NULL;
}


DEFINE_ANE_FUNCTION( fillInBooleans ) {
    return NULL;
}

DEFINE_ANE_FUNCTION( fillInUInts ) {
    return NULL;
}

DEFINE_ANE_FUNCTION( fillInInts ) {
    return NULL;
}

DEFINE_ANE_FUNCTION( fillInDoubles ) {
    return NULL;
}

DEFINE_ANE_FUNCTION( fillInStrings ) {
    return NULL;
}

DEFINE_ANE_FUNCTION( fillInObjects ) {
    FREObject vect = argv[0];
    uint32_t len;
    FREGetArrayLength(vect, &len);
    FREObject simpleObject;

    for (int i = 0; i < len; i++ ) {
        FREGetArrayElementAt(vect, i, &simpleObject);
        FRESetObjectProperty(simpleObject, (const uint8_t*)"number", [FREUtils FREObjectFromInt:i], NULL);
    }
    return NULL;
}

DEFINE_ANE_FUNCTION( writeToLog ) {
    NSString* logString = [FREUtils NSStringFromFREObject:argv[0]];
    NSLog(@"%@", logString);
    
    return NULL;
}

void ExtContextInitializer( void* extData,
                            const unsigned char* ctxType,
                            FREContext ctx,
                            uint32_t* numFunctionsToTest,
                            const FRENamedFunction** functionsToSet ) {
    
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION( run0Arg ),
        MAP_FUNCTION( run1Arg ),
        MAP_FUNCTION( run2Arg ),
        MAP_FUNCTION( run3Arg ),
        MAP_FUNCTION( run4Arg ),
        MAP_FUNCTION( run5Arg ),
        MAP_FUNCTION( returnBool ),
        MAP_FUNCTION( returnUInt ),
        MAP_FUNCTION( returnInt ),
        MAP_FUNCTION( returnDouble ),
        MAP_FUNCTION( returnString ),
        MAP_FUNCTION( returnVector ),
        MAP_FUNCTION( returnObject ),
        MAP_FUNCTION( createBooleans ),
        MAP_FUNCTION( createUInts ),
        MAP_FUNCTION( createInts ),
        MAP_FUNCTION( createDoubles ),
        MAP_FUNCTION( createStrings ),
        MAP_FUNCTION( createObjects ),
        MAP_FUNCTION( fillInBooleans ),
        MAP_FUNCTION( fillInUInts ),
        MAP_FUNCTION( fillInInts ),
        MAP_FUNCTION( fillInDoubles ),
        MAP_FUNCTION( fillInStrings ),
        MAP_FUNCTION( fillInObjects ),
        MAP_FUNCTION( writeToLog )
    };
    
	*numFunctionsToTest = sizeof( functionMap ) / sizeof( FRENamedFunction );
    *functionsToSet = functionMap;
}

void ANEExtensionInitializer( void** extDataToSet,
                                  FREContextInitializer* ctxInitializerToSet,
                                  FREContextFinalizer* ctxFinalizerToSet) {
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ExtContextInitializer;
}