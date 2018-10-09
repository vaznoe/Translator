//
//  TGSupportLanguage.h
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const KeySupportLanguagesDirs;
extern NSString *const KeySupportLanguagesLangs;

@class TGCountry;
@interface TGSupportLanguage : NSObject
@property (copy, nonatomic, readonly) NSArray<TGCountry*> *outputCountries;
@property (copy, nonatomic, readonly) TGCountry *inputCountry;

- (instancetype) initWithInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary*) langsDictionary;
- (void) addInputOutputCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary*)langsDictionary;

@end
