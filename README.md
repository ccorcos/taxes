# [Taxes](tax-writeoffs.meteor.com)

## TODO

- icon, splash
- zip on mobile?
- backups
- deploy

## Notes

    meteor add cordova:org.apache.cordova.camera

    meteor run ios-device --mobile-server https://tax-writeoffs.com


    cd private/IconSplashMaker  
    coffee generateIconSplash.coffee


    trash .meteor/local/
    meteor run ios-device
    # PCH error
    trash /var/folders/x5/mdr8syvj7lsb_sg_pr0j7y_h0000gn/C/com.apple.DeveloperTools/6.1.1-6A2008a/Xcode/SharedPrecompiledHeaders/
    trash .meteor/local/
    meteor run ios-device