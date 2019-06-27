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
First, This Flutter web was ver preview. 
This version was not implemented key code for macOS, Windows and linux yet.
TODO was written in packages/flutter_web/lib/src/services/raw_keyboard.dart.
Second, In this version, All keymap was fixed on Android.
TODO was written in flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart.
I changed the keymap that was fixed Android to fuchsia.(fushsia was next os build by google.)
I was able to get the key code 97 I was expecting.

### Before
<img src="https://user-images.githubusercontent.com/423416/60225285-1d591c00-98c1-11e9-8b51-92557e311edf.png" width="480px">

### After
<img src="https://user-images.githubusercontent.com/423416/60225302-306bec00-98c1-11e9-8993-eff9ae811483.png" width="480px">

### Note
package:flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 257:5       fromMessage
package:flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 504:43      _handleKeyEvent
package:flutter_web/src/services/packages/flutter_web/src/services/raw_keyboard.dart 503:34      [_handleKeyEvent]
package:flutter_web/src/services/packages/flutter_web/src/services/platform_channel.dart 67:49   <fn>
package:flutter_web/src/services/packages/flutter_web/src/services/platform_channel.dart 66:56   <fn>
package:flutter_web/src/services/packages/flutter_web/src/services/platform_messages.dart 70:33  handlePlatformMessage
package:flutter_web/src/services/packages/flutter_web/src/services/platform_messages.dart 64:44  handlePlatformMessage
package:flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart 75:15                    [_handleHtmlEvent]
package:flutter_web_ui/packages/flutter_web_ui/src/engine/keyboard.dart 25:7                     <fn>