// This section sets up some basic app metadata,
// the entire section is optional.
App.info({
  id: 'com.chetcorcos.tax-write-offs',
  name: 'Tax Write-offs',
  description: 'Save your tax write-off receipts.',
  author: 'Chet Corcos',
  email: 'ccorcos@gmail.com',
  website: 'http://www.chetcorcos.com',
  version: '1.0.0'
});

App.icons({
  // iOS
  'iphone': 'public/icons/apple-touch-icon-57x57.png',
  'iphone_2x': 'public/icons/apple-touch-icon-114x114.png',
  'iphone_3x': 'public/icons/apple-touch-icon-171x171.png',
  'ipad': 'public/icons/apple-touch-icon-72x72.png',
  'ipad_2x': 'public/icons/apple-touch-icon-144x144.png',

  // Android
  'android_ldpi': 'public/icons/android-ldpi-icon-36x36.png',
  'android_mdpi': 'public/icons/android-mdpi-icon-48x48.png',
  'android_hdpi': 'public/icons/android-hdpi-icon-72x72.png',
  'android_xhdpi': 'public/icons/android-xhdpi-icon-96x96.png'
});

App.launchScreens({
  // iOS
  'iphone': 'public/splash/apple-touch-startup-image-320x480.png',
  'iphone_2x': 'public/splash/apple-touch-startup-image-640x960.png',
  'iphone5': 'public/splash/apple-touch-startup-image-640x1136.png',
  'ipad_portrait': 'public/splash/apple-touch-startup-image-768x1024.png',
  'ipad_portrait_2x': 'public/splash/apple-touch-startup-image-1536x2048.png',
  'ipad_landscape': 'public/splash/apple-touch-startup-image-1024x768.png',
  'ipad_landscape_2x': 'public/splash/apple-touch-startup-image-2048x1536.png',

  // Android
  'android_ldpi_portrait': 'public/splash/android-ldpi-startup-image-200x320.png',
  'android_ldpi_landscape': 'public/splash/android-ldpi-startup-image-320x200.png',
  'android_mdpi_portrait': 'public/splash/android-mdpi-startup-image-320x480.png',
  'android_mdpi_landscape': 'public/splash/android-mdpi-startup-image-480x320.png',
  'android_hdpi_portrait': 'public/splash/android-hdpi-startup-image-480x800.png',
  'android_hdpi_landscape': 'public/splash/android-hdpi-startup-image-800x480.png',
  'android_xhdpi_portrait': 'public/splash/android-xhdpi-startup-image-720x1280.png',
  'android_xhdpi_landscape': 'public/splash/android-xhdpi-startup-image-1280x720.png'
});

// Set PhoneGap/Cordova preferences
App.setPreference('BackgroundColor', '0x000000ff');
App.setPreference('HideKeyboardFormAccessoryBar', true);
App.setPreference('DisallowOverscroll', true);
App.setPreference('BackupWebStorage', 'none');

