//
//  TGCoreDataService.h
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TGCountry;
@class TGSupportLanguage;
@interface TGCoreDataService : NSObject

- (void) saveSupportLanguages:(NSArray<TGSupportLanguage*>*)supports;
- (NSArray<TGCountry*>*)getInputCountries;
- (NSArray<TGCountry*>*)getOutputCountriesWithInputCountryCode:(NSString*)inputCountryCode;

@end

