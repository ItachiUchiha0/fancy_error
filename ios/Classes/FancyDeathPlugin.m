#import "FancyDeathPlugin.h"
#if __has_include(<fancy_death/fancy_death-Swift.h>)
#import <fancy_death/fancy_death-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fancy_death-Swift.h"
#endif

@implementation FancyDeathPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFancyDeathPlugin registerWithRegistrar:registrar];
}
@end
