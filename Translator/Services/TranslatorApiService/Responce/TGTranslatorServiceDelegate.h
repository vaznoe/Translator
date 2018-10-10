//
//  TGTranslatorServiceDelegate.h
//  Translator
//
//  Created by Tetiana Galushko on 10/9/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TGTranslatorService;
@class TGSupportLanguage;
@protocol TGTranslatorServiceDelegate <NSObject>

-(void)translatorApiService: (TGTranslatorService*) service didSupportLanguages: (NSArray<TGSupportLanguage*>*)supportLanguages;
-(void)traslatorService: (TGTranslatorService*) servoce didFailWithError: (NSError*) error;

@end
