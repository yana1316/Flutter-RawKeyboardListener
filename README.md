日本語版: https://qiita.com/yana1316/items/3116f00a6760a76a4b20

## Purpose
This code can check key code in Flutter web. (2019.06.27)

## Problem
I wanted to create typing software using Flutter web.
I took key code when key dwon on Desktop browser (on macos Chrome).
But, it's different key code.
For example, I tried key down 'a', and got key code 4295754122.
It was wrong, I hoped to get key code 97.

## Investigate
I took the key code directly from the browser with javascript.
This repository is the code at that time.
I took key code 97 from javascript.
I considered why key code was got different result.
So, I found out this cause.

## Cause
First, This Flutter web was version preview. 
This version was not implemented key code for macOS, Windows and linux yet.
TODO was written in packages/flutter_web/lib/src/services/raw_keyboard.dart.

Second, In this version, All keymap was fixed on Android.
TODO was written in flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart.
I changed the keymap from Android to fuchsia.(fushsia is future OS by google. I used it, because this version was not implemented macOS.)
I tried again, I was able to get the key code 97 I was expecting.

### Before
![Screen Shot 2019-06-27 at 10 46 44](https://user-images.githubusercontent.com/423416/60227216-7167fe80-98c9-11e9-8641-11682ed24e3b.png)

### After
![Screen Shot 2019-06-27 at 10 50 09](https://user-images.githubusercontent.com/423416/60227219-7af16680-98c9-11e9-8ec6-ed8ffa9d3d46.png)

### Note
flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 257:5       fromMessage
flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 504:43      _handleKeyEvent
flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 503:34      [_handleKeyEvent]
flutter_web/src/services/packages/flutter_web/src/services/platform_channel.dart 67:49   <fn>
flutter_web/src/services/packages/flutter_web/src/services/platform_channel.dart 66:56   <fn>
flutter_web/src/services/packages/flutter_web/src/services/platform_messages.dart 70:33  handlePlatformMessage
flutter_web/src/services/packages/flutter_web/src/services/platform_messages.dart 64:44  handlePlatformMessage
flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart 75:15                    [_handleHtmlEvent]
flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart 25:7                     <fn>