//
//  Lokalise.h
//  Lokalise
//
//  Created by Fjodors Levkins on 20/05/15.
//  Copyright (c) 2015 Lokalise SIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSZipArchive.h"

@protocol LokaliseDelegate;

/**
 *  Lokalise framework error domain
 */
extern NSString *const LKLErrorDomain;
/**
 *  Lokalise API error domain
 */
extern NSString *const LKLAPIErrorDomain;

@interface Lokalise : NSObject

+ (instancetype)sharedObject;

/**
 *  Lokalise API access token.
 */
@property (strong, nonatomic, readonly) NSString *token;
/**
 *  Lokalise Project ID.
 */
@property (strong, nonatomic, readonly) NSString *projectID;
/**
 *  Localization version.
 */
@property (nonatomic) NSInteger localizationVersion;
/**
 *  Determines is pre release localization is required.
 *  You must call `checkForUpdates` manually after changing this parameter.
 */
@property (nonatomic) BOOL preReleaseLocalization;
/**
 *  Determines is only local localization is used
 */
@property (nonatomic) BOOL forceLocalLocalization;
/**
 *  Currently selected localization locale.
 *  Can be set only to one of available locales.
 */
@property (strong, nonatomic) NSLocale *localizationLocale;
/**
 *  Lokalise framework delegate
 */
@property (weak, nonatomic) id<LokaliseDelegate> delegate;
/**
 *  @return NSArray of NSLocale objects. Always has at least one locale.
 */
- (NSArray*)availableLocales;
/**
 *  @discussion This method returns the following when key is nil or not found in table:
 
     - If key is nil and value is nil, returns an empty string.
 
     - If key is nil and value is non-nil, returns value.
 
     - If key is not found and value is nil or an empty string, returns key.
 
     - If key is not found and value is non-nil and not empty, return value.
 *
 *  @param key   The key for a string in the table identified by tableName.
 *  @param value The value to return if key is nil or if a localized string for key can’t be found in the table.
 *  @param table The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.
 *
 *  @return A localized version of the string designated by key in table tableName.
 */
- (NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
/**
 *  Check if new localization version is available and downloads it.
 */
- (void)checkForUpdates;
/**
 *  Deletes all files downloaded by lokalise framework.
 */
- (void)deleteLokaliseData;

/**
 *  Forces [[NSBundle mainBundle] localizedStringForKey:key value:value table:tableName] to use [[Lokalise shareObject] localizedStringForKey:key value:value table:tableName].
 * @warning: This is an experimental feature at the moment
 */
- (void)swizzleMainBundle;
/**
 * Deswizzles [[NSBundle mainBundle] localizedStringForKey:key value:value table:tableName].
 * @warning: This is an experimental feature at the moment
 */
- (void)deswizzleMainBundle;

@end

@protocol LokaliseDelegate <NSObject>

- (void)lokaliseDidUpdateLocalization:(Lokalise*)lokalise;
- (void)lokaliseDidCheckForUpdates:(Lokalise*)lokalise;
- (void)lokalise:(Lokalise*)lokalise didFailToUpdateLocalizationWithError:(NSError*)error;
- (void)lokalise:(Lokalise*)lokalise didFailToLoadLocalizationForLocale:(NSLocale*)locale error:(NSError*)error;

@end