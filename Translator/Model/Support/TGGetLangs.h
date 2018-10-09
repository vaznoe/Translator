//
//  TGGetLangs.h
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TGSupportLanguage;
@interface TGGetLangs : NSObject
@property (strong, nonatomic, readonly) NSArray <TGSupportLanguage*> *supports;

-(void)addInputOutputCountryCode:(NSString *)inputOutputCode andLangsDictionary:(NSDictionary *)langsDictionary;

@end
