# Enable privacy snapshot for React Native

In the [App Programming Guide for iOS](https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html#//apple_ref/doc/uid/TP40007072-CH4-SW8), Apple says:

> When an app transitions to the background, the system takes a snapshot of the app’s main window, which it then presents briefly when transitioning your app back to the foreground. Before returning from your `applicationDidEnterBackground:` method, you should hide or obscure passwords and other sensitive personal information that might be captured as part of the snapshot.

This react-native module obscure passwords and other sensitive personal information when an app transitions to the background.

### `PrivacySnapshot.enabled(false)`

![Screenshot of the multi-tasking screen](screenshot1.png)

### `PrivacySnapshot.enabled(true)`

![Screenshot of the multi-tasking screen with privacy screenshot](screenshot2.png)

## Installation iOS

1. Run `npm install react-native-privacy-snapshot --save` in your project directory
1. Run `(cd ios && pod install)` to trigger react-native autolinking

## Easy Usage

```javascript
import { usePrivacySnapshot} from 'react-native-privacy-snapshot';

...

  usePrivacySnapshot()


```

## API

The following functions are exported:

### usePrivacySnapshot

Hook to apply the privacy snapshot when app goes to background. This will apply as long as this component is mounted

#### Usage

```js
import { usePrivacySnapshot } from "react-native-privacy-snapshot";

const MyComponent = () => {
  usePrivacySnapshot();
  return <View>...</View>;
};
```

### enabled(doEnable: boolean)

Enable the privacy screen to trigger when app goes to background.

#### Usage

```js
import { enabled } from "react-native-privacy-snapshot";
enabled(true);
//Later...
enabled(false);
```

### show

Show the privacy screen right now

#### Usage

```js
import { show } from "react-native-privacy-snapshot";
show();
```

### show

Hide the privacy screen right now

#### Usage

```js
import { show, hide } from "react-native-privacy-snapshot";
show();
//Later
hide();
```
