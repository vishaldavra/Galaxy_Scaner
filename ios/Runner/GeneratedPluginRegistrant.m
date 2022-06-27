//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<device_info_plus/FLTDeviceInfoPlusPlugin.h>)
#import <device_info_plus/FLTDeviceInfoPlusPlugin.h>
#else
@import device_info_plus;
#endif

#if __has_include(<flutter_beep/FlutterBeepPlugin.h>)
#import <flutter_beep/FlutterBeepPlugin.h>
#else
@import flutter_beep;
#endif

#if __has_include(<flutter_qrcode_scanner/FlutterQrcodeScannerPlugin.h>)
#import <flutter_qrcode_scanner/FlutterQrcodeScannerPlugin.h>
#else
@import flutter_qrcode_scanner;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<shared_preferences_ios/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences_ios/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTDeviceInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDeviceInfoPlusPlugin"]];
  [FlutterBeepPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBeepPlugin"]];
  [FlutterQrcodeScannerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterQrcodeScannerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
