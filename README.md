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

活动事件：显示电池保护程序设置。 = "android.settings.BATTERY_SAVER_SETTINGS";
活动事件：显示设置，允许蓝牙配置。 = "android.settings.BLUETOOTH_SETTINGS";
活动事件：显示设置，允许日期和时间配置。 = "android.settings.DATE_SETTINGS";
活动事件：显示一般的设备信息设置（序列号，软件版本，电话号码等）。 = "android.settings.DEVICE_INFO_SETTINGS";
活动事件：显示设置，让显示器的配置。 = "android.settings.DISPLAY_SETTINGS";
活动事件：显示主页选择设置。 = "android.settings.HOME_SETTINGS";
活动事件：内部存储显示设置。 = "android.settings.INTERNAL_STORAGE_SETTINGS";
活动事件：显示设置，允许区域的配置。 = "android.settings.LOCALE_SETTINGS";
活动事件：显示设置，以允许当前的位置信息源的配置。 = "android.settings.LOCATION_SOURCE_SETTINGS";
活动事件：显示设置来管理所有应用程序。 = "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS";
活动事件：显示设置来管理安装的应用程序。 = "android.settings.MANAGE_APPLICATIONS_SETTINGS";
活动事件：内存卡存储显示设置。 = "android.settings.MEMORY_CARD_SETTINGS";
活动操作：选择网络运营商显示设置。 = "android.settings.NETWORK_OPERATOR_SETTINGS";
活动事件：显示通知监听器设置。 = "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS";
活动事件：显示系统设置。 = "android.settings.SETTINGS";
活动事件：显示设置，以允许声音和音量的配置。 = "android.settings.SOUND_SETTINGS";

## Installation

    cordova plugin add cordova-plugin-open-native

## Supported Platforms

cordova.plugins.OpenNative
- Android


cordova.plugins.OpenNative.open
- Android
- iOS

## open

#### Example

    // 打开定位服务
    cordova.plugins.OpenNative.open("android.settings.LOCATION_SOURCE_SETTINGS", function(s){
    				alert(s);
    			}, function(e){
    				alert(e);
    			});

