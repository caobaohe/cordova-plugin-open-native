/********* OpenNative.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface OpenNative : CDVPlugin {
  // Member variables go here.
}

- (void)open:(CDVInvokedUrlCommand*)command;
@end

@implementation OpenNative

- (void)open:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    NSString* intent = nil;
    NSLog(@"echo: %@", echo);
    if ([@"setting_service" isEqualToString:echo]) {
        intent = @"App-Prefs:root=SETTING";
    } else if ([@"location_service" isEqualToString:echo]) {
        intent = @"App-Prefs:root=Privacy&path=LOCATION";
    } else if ([@"bluetooth_service" isEqualToString:echo]) {
        intent = @"App-Prefs:root=Bluetooth";
    } else if ([@"date_service" isEqualToString:echo]) {
        //intent = @"App-Prefs:root=General&path=INTERNATIONAL";
        intent = @"App-Prefs:root=General&path=DATE_AND_TIME";
    } else if ([@"sound_service" isEqualToString:echo]) {
        intent = @"App-Prefs:root=Sounds";
    }
    NSURL *url = [NSURL URLWithString:intent];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"url is error"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
