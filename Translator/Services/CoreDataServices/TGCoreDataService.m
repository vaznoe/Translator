//
//  TGCoreDataService.m
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import "TGCoreDataService.h"
#import "AppDelegate.h"

#import "TGSupportLanguage.h"
#import "TGCountry.h"

#import "SupportEntity+CoreDataProperties.h"
#import "CountryEntity+CoreDataProperties.h"

static NSString *const Support_Entity = @"SupportEntity";
static NSString *const Country_Entity = @"CountryEntity";

@interface TGCoreDataService ()
@property (strong, nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@end

@implementation TGCoreDataService

-(void)saveSupportLanguage:(TGSupportLanguage *)support {
    SupportEntity *supportEntity = [NSEntityDescription insertNewObjectForEntityForName:Support_Entity inManagedObjectContext:self.managedObjectContext];
    [supportEntity setInputCountryCode:support.inputCountry.code];
    [supportEntity setInputCountryName:support.inputCountry.name];
    
    for (TGCountry *country in support.outputCountries) {
        CountryEntity *countryEntity = [NSEntityDescription insertNewObjectForEntityForName:Country_Entity inManagedObjectContext:self.managedObjectContext];
        [countryEntity setCode:country.code];
        [countryEntity setName:country.name];
        [supportEntity addCountriesObject:countryEntity];
    }
}

- (void) saveSupportLanguages:(NSArray<TGSupportLanguage *> *)supports {
    [self removeAllSupportLanguages];
    
    for (TGSupportLanguage *support in supports) {
        [self saveSupportLanguages:support];
    }
    
    [self.managedObjectContext save:nil];
}

-(NSArray<TGCountry *> *)getInputCountries {
    NSEntityDescription *description = [NSEntityDescription entityForName:Support_Entity inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:description];
    
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error || result.count == 0){
        return @[];
    }
    
    NSMutableArray *mutableCoutries = [NSMutableArray array];
    for (SupportEntity *supportEntity in result) {
        TGCountry *inputCountry = [[TGCountry alloc] initCountryCode:supportEntity.inputCountryCode andCountryName:supportEntity.inputCountryName];
        [mutableCoutries addObject: inputCountry];
    }
    return [mutableCoutries copy];
}

-(NSArray<TGCountry *> *)getOutputCountriesWithInputCountryCode:(NSString *)inputCountryCode {
    NSEntityDescription *description = [NSEntityDescription entityForName:Support_Entity inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:description];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"inputCountryCode == %@", inputCountryCode];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error || result.count == 0){
        return @[];
    }
    
    NSMutableArray *mutableCoutries = [NSMutableArray array];
    SupportEntity *supportEntity = result.firstObject;
    for (CountryEntity *countryEntity in supportEntity.countries) {
        TGCountry *outputCountry = [[TGCountry alloc] initCountryCode:countryEntity.code andCountryName:countryEntity.name];
        [mutableCoutries addObject: outputCountry];
    }
    return [mutableCoutries copy];}

- (void) removeAllSupportLanguages {
    NSEntityDescription *description = [NSEntityDescription entityForName:Support_Entity inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:description];
    
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:&error];
    for (NSManagedObject *obj in result) {
        [self.managedObjectContext deleteObject:obj];
    }
}

#pragma mark - Property
-(NSManagedObjectContext *)managedObjectContext {
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return app.persistentContainer.viewContext;
}

@end
