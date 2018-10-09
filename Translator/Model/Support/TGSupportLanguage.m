//
//  TGSupportLanguage.m
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGSupportLanguage.h"
#import "TGCountry.h"

NSString* const KeySupportLanguagesDirs = @"dirs";
NSString* const KeySupportLanguagesLangs = @"langs";

@implementation TGSupportLanguage
-(instancetype)initWithInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    self = [super init];
    if (self) {
        [self addInputOutputCode:inputOutputCode andLangsDictionary:langsDictionary];
    }
    return self;
}

-(void)addInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary {
    NSUInteger loc = [inputOutputCode rangeOfString:@"-"].location;
    if (loc == NSNotFound) {
        return;
    }
    
    NSString *inputCode = [inputOutputCode substringToIndex:loc];
    NSString *name = langsDictionary[inputCode];
    if (inputOutputCode && name && !_inputCountry) {
        _inputCountry = [[TGCountry alloc] initCountryCode:inputCode andCountryName:name];
    }
    
    NSMutableArray *mutable = self.outputCountries ? [self.outputCountries mutableCopy] : [NSMutableArray array];
    NSString *outputCode = [inputOutputCode substringFromIndex:loc + 1];
    TGCountry *outputCountry = [[TGCountry  alloc] initCountryCode:outputCode andCountryName:langsDictionary[outputCode]];
    [mutable addObject:outputCountry];
    _outputCountries = [mutable copy];
}
@end
