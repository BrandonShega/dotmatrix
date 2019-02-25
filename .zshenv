if [[ "$OSTYPE" == "darwin"* ]]; then
    PATH=/Applications/Emacs.app/Contents/MacOS/Emacs:$PATH
    PATH=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient:$PATH
fi
PATH=$HOME/.rvm/bin:$PATH
PATH=$HOME/.bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH
PATH=$HOME/.composer/vendor/bin:$PATH
PATH=$HOME/Documents/flutter/bin:$PATH
