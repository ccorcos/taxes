## Getting Started

You will need the coffeescript commandline interpreter.

    npm install -g coffee-script

The change directory to the IconSplashMaker directory and install the NPM dependancies.

    cd private/IconSplashMaker
    npm install

You'll also need SlimerJS which also requires Firefox. If you don't already have Firefox installed, you can install it using `brew cask`.

    brew install slimerjs --without-xulrunner 
    brew cask install firefox

You'll also need an environment variable for SlimerJS to find Firefox. You may want to put this in your `.bashrc`.

    export SLIMERJSLAUNCHER=~/Applications/Firefox.app/Contents/MacOS/firefox

Make sure your Meteor server is up and running, and generate all your icons and splash screens:

    coffee generateIconSplash.coffee
