---
title: Open Native
description: Open Native system application.
---

# cordova-plugin-open-native

此插件提供了打开设备的原生应用方法。
此插件定义全局对象，包括cordova.plugins.OpenNative。

    document.addEventListener("deviceready", onDeviceReady, false);
    function onDeviceReady() {
        console.log(cordova.plugins.OpenNative);
    }

活动事件：显示系统设置。 = "setting_service"; 
活动事件：显示设置，以允许当前的位置信息源的配置。 = "location_service";
活动事件：显示设置，允许蓝牙配置。 = "bluetooth_service";
活动事件：显示设置，允许日期和时间配置。 = "date_service";
活动事件：显示设置，以允许声音和音量的配置。 = "sound_service";

## Installation

    cordova plugin add cordova-plugin-open-native

## Supported Platforms

cordova.plugins.OpenNative
- Android
- iOS


cordova.plugins.OpenNative.open
- Android
- iOS

## open

#### Example

    // 打开定位服务
    cordova.plugins.OpenNative.open("location_service", function(s){
    				alert(s);
    			}, function(e){
    				alert(e);
    			});

