//
//  TGResponce.m
//  Translator
//
//  Created by Tetiana Galushko on 10/9/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGResponce.h"

@implementation TGResponce

-(instancetype) initWithObject:(id)object andDelegate:(id<TGTranslatorServiceDelegate>) delegate {
    self = [super init];
    if (self) {
        _object = object;
        _delegate = delegate;
    }
    return self;
}

-(void) parseServiceDictionary:(NSDictionary*) serverDictionary {
    
}

-(void) setResponceServiceData:(NSData*) data andError:(NSError*) error {
    if (error) {
        [self serverError:error];
    } else {
        NSError *readError = nil;
        NSDictionary *responceServer = [NSJSONSerialization JSONObjectWithData:data options:0 error:&readError];
        if (readError) {
            [self serverError:readError];
            return;
        }
        
        NSUInteger code = [responceServer[@"code"] integerValue];
        if (code == 200 || code == 0) {
            [self parseServiceDictionary:responceServer];
        } else {
            NSError *responceError = [NSError errorWithDomain:@"Server" code:code userInfo:@{ErrorText:responceServer[@"message"] ? @"" : @"Error data"}];
            [self serverError:responceError];
        }
    }
}

-(void) serverError:(NSError*) error {
    if ([self.delegate respondsToSelector:@selector(translatorApiService:didSupportLanguages:)]) {
        [self.delegate traslatorService:[TGTranslatorApiService new] didFailWithError:error];
    }
}

@end
