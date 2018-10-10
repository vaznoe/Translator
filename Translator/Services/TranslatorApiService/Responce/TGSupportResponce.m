//
//  TGSupportResponce.m
//  Translator
//
//  Created by Tetiana Galushko on 10/9/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGSupportResponce.h"
#import "TGSupportLanguage.h"
#import "TGGetLangs.h"
#import "TGCoreDataService.h"

@implementation TGSupportResponce

-(void) parseServiceDictionary:(NSDictionary*) serverDictionary {
    NSArray *inputOutputCodes = serverDictionary[KeySupportLanguagesDirs];
    NSDictionary *langDictionary = serverDictionary[KeySupportLanguagesLangs];
    
    TGGetLangs *getLangs = [TGGetLangs new];
    for (NSString *inputOutputCode in inputOutputCodes) {
        [getLangs addInputOutputCountryCode:inputOutputCode andLangsDictionary:langDictionary];
    }
    
    TGCoreDataService *cDataService = [TGCoreDataService new];
    [cDataService saveSupportLanguages:getLangs.supports];
    
    if ([self.delegate respondsToSelector:@selector(translatorApiService:didSupportLanguages:)]) {
        [self.delegate translatorApiService:[TGTranslatorApiService new] didSupportLanguages:getLangs.supports];
    }
}

@end
