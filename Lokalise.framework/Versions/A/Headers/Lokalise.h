//
//  Lokalise.h
//  Lokalise
//
//  Created by Fjodors Levkins on 20/05/15.
//  Copyright (c) 2015 Lokalise SIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LokaliseLocalizationType.h"

@protocol LokaliseDelegate;

@interface Lokalise : NSObject

@property (class, readonly, strong) Lokalise *__nonnull sharedObject NS_SWIFT_NAME(shared);

/**
 Lokalise API access token.
 */
@property (strong, nonatomic, readonly, nullable) NSString *apiToken;

/**
 Lokalise Project ID.
 */
@property (strong, nonatomic, readonly, nullable) NSString *projectID;

/**
 Determines what source is used for localization.
 Set to `LokaliseLocalizationRelease` by default.
 */
@property (nonatomic) LokaliseLocalizationType localizationType;

/**
 Currently selected localization locale.
 Can be set only to one of available locales.
 */
@property (strong, nonatomic, nonnull) NSLocale *localizationLocale;

/**
 Lokalise framework delegate
 */
@property (weak, nonatomic, nullable) id<LokaliseDelegate> delegate;

/**
 Set api token and project ID.

 @param apiToken Lokalise API Token.
 @param projectID Project ID.
 */
- (void)setAPIToken:(NSString *__nonnull)apiToken projectID:(NSString *__nonnull)projectID;

/**
 @return NSArray of NSLocale objects. Always has at least one locale.
 */
- (NSArray <NSLocale *> *__nonnull)availableLocales;

/**
 
 This method returns the following when key is nil or not found in table:
 
 - If key is nil and value is nil, returns an empty string.

 - If key is nil and value is non-nil, returns value.

 - If key is not found and value is nil or an empty string, returns key.

 - If key is not found and value is non-nil and not empty, return value.

 @param key   The key for a string in the table identified by tableName.
 @param value The value to return if key is nil or if a localized string for key can’t be found in the table.
 @param tableName The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.

 @return A localized version of the string designated by key in table tableName.
 */
- (NSString *__nonnull)localizedStringForKey:(NSString *__nonnull)key value:(NSString *__nullable)value table:(NSString *__nullable)tableName NS_FORMAT_ARGUMENT(1);

/**
 Check if new localization version is available and downloads it.
 */
- (void)checkForUpdates;

/**
Deletes all files downloaded by lokalise framework.
 */
- (void)deleteLokaliseData;

/**
 Forces [[NSBundle mainBundle] localizedStringForKey:key value:value table:tableName] to use [[Lokalise shareObject] localizedStringForKey:key value:value table:tableName].
 */
- (void)swizzleMainBundle;

/**
 Deswizzles [[NSBundle mainBundle] localizedStringForKey:key value:value table:tableName].
 */
- (void)deswizzleMainBundle;

@end

@protocol LokaliseDelegate <NSObject>

@optional
- (void)lokaliseDidUpdateLocalization:(Lokalise*__nonnull)lokalise;
- (void)lokaliseDidCheckForUpdates:(Lokalise*__nonnull)lokalise;
- (void)lokalise:(Lokalise*__nonnull)lokalise didFailToUpdateLocalizationWithError:(NSError*__nonnull)error;
- (void)lokalise:(Lokalise*__nonnull)lokalise didFailToLoadLocalizationForLocale:(NSLocale*__nonnull)locale error:(NSError*__nonnull)error;

@end
