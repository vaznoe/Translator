//
//  TGCoreDataService.m
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGCoreDataService.h"
#import "AppDelegate.h"

@interface TGCoreDataService ()
@property (strong, nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@end

@implementation TGCoreDataService

-(void)saveSupportLanguages:(NSArray<TGSupportLanguage *> *)supports {
    
}

-(NSArray<TGCountry *> *)getInputCountries {
    return @[];
}

-(NSArray<TGCountry *> *)getOutputCountriesWithInputCountryCode:(NSString *)inputCountryCode {
    return @[];
}

-(NSManagedObjectContext *)managedObjectContext {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return app.persistentContainer.viewContext;
}

@end
