//
//  TGGetLangs.m
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGGetLangs.h"
#import "TGSupportLanguage.h"

@implementation TGGetLangs

-(void)addInputOutputCountryCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    NSUInteger loc = [inputOutputCode rangeOfString:@"-"].location;
    if (loc == NSNotFound) {
        return;
    }
    
    NSString *inputCode = [inputOutputCode substringToIndex:loc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"inputCountry.code == %@", inputCode];
    NSArray *result = [self.supports filteredArrayUsingPredicate:predicate];
    if ( result.count == 0) {

        NSMutableArray *mutableSupports = self.supports ? [self.supports mutableCopy] : [NSMutableArray array];
        TGSupportLanguage *support = [[TGSupportLanguage alloc] initWithInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
        [mutableSupports addObject:support];
        _supports = [mutableSupports copy];
    } else {
        TGSupportLanguage *currentSupport = result.firstObject;
        [currentSupport addInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
}

@end
