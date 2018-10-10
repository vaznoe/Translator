//
//  TGResponce.h
//  Translator
//
//  Created by Tetiana Galushko on 10/9/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TGTranslatorServiceDelegate.h"
#import "TGTranslatorApiService.h"

@interface TGResponce : NSObject
@property (strong, nonatomic, readonly) id object;
@property (weak, nonatomic, readonly) id<TGTranslatorServiceDelegate> delegate;

-(instancetype) initWithObject:(id)object andDelegate:(id<TGTranslatorServiceDelegate>) delegate;
-(void) setResponceServiceData:(NSData*) data andError:(NSError*) error;
-(void) parseServiceDictionary:(NSDictionary*) serverDictionary;

@end
