//
//  TGCountry.h
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGCountry : NSObject
@property (strong, nonatomic, readonly) NSString *code;
@property (strong, nonatomic, readonly) NSString *name;

- (instancetype) initCountryCode:(NSString *)countryCode andCountryName:(NSString *)countryName;

@end
