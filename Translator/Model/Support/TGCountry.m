//
//  TGCountry.m
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGCountry.h"

@implementation TGCountry

-(instancetype)initCountryCode:(NSString *)countryCode andCountryName:(NSString *)countryName {
    self = [super init];
    if (self) {
        _code = countryCode;
        _name = countryName;
    }
    return self;
}
@end
