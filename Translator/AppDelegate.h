//
//  AppDelegate.h
//  Translator
//
//  Created by Tetiana Galushko on 10/5/18.
//  Copyright © 2018 Tatiana Galushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

