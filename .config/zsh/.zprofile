emulate sh
source ~/.profile
emulate zsh


# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

##
# Your previous /Users/akira/.zprofile file was backed up as /Users/akira/.zprofile.macports-saved_2025-12-04_at_13:43:41
##

# MacPorts Installer addition on 2025-12-04_at_13:43:41: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

