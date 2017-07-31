/********* OpenNative.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface OpenNative : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation OpenNative

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
	
	/*
    NSURL *url = [NSURL URLWithString:@"App-Prefs:root=Privacy&path=LOCATION"];
    [[UIApplication sharedApplication] openURL:url];
    */
    NSURL *url = [NSURL URLWithString:@"App-Prefs:root=Privacy&path=LOCATION"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"url is error"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
