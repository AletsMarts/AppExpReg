//
//  main.m
//  AppExpReg
//
//  Created by Guest User on 16/10/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //NSString *cadenaPrueba = @"abcd abc ac bc dc AC BC Tec";
        NSString *cadenaPrueba = @"10101010 101010"/*@"FACE abcd"*//* 1234"*/;
        //VALIDAR NUMEROS HEXADECIMALES CON EXP. REG.
        NSLog(@"Cadena a Analizar: %@", cadenaPrueba);
        
        NSError *error = NULL;
        
        NSMutableString *cadenaPatron = [[NSMutableString alloc]init];
        //[cadenaPatron appendString:@"\\b(a|b|T)(c|d|e)(c)\\b"];
        //VALIDAR NUMEROS HEXA
        [cadenaPatron appendString:@"[0-1]{1,8}"];
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:cadenaPatron options:1/*NSRegularExpressionCaseInsensitive*/
            error:&error];
        
        
        //del ejemplo de la página de Apple
        /*
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:string
                                                            options:0
                                                              range:NSMakeRange(0, [string length])];
         */
        
        NSArray *matches = [regex matchesInString:cadenaPrueba
        options:1
        range:NSMakeRange(0, cadenaPrueba.length)];
        //foreach
        for (NSTextCheckingResult *matchResult in matches) {
            NSString *match = [cadenaPrueba substringWithRange:matchResult.range];
            NSLog(@"La cadena contiene: %@", match);
        }
        
        //EJEMPLO DE LA PAG. APPLE
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:cadenaPrueba
                                                            options:0
                                                              range:NSMakeRange(0, [cadenaPrueba length])];
        
        NSLog(@"Número de Coincidencias: %ld", numberOfMatches);
    }
    return 0;
}
