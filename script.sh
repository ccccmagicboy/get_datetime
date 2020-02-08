#!/usr/bin/env bash
# auther: ccccmagicboy 
# url: ccrobot-online.com

#echo hello the world!
#echo $INPUT_TEST
# echo TZ="$INPUT_TZ1/$INPUT_TZ2"
# sudo timedatectl set-timezone $INPUT_TZ1/$INPUT_TZ2
# echo "::set-output name=datetime::$(date +'%Y%m%d_%H%M%S')"

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform    
    echo "Darwin"
    brew install coreutils
    alias readlink=greadlink
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
    echo "MINGW32_NT"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
    echo "MINGW64_NT"
fi

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

python -m pip install --upgrade pip
pip install -U pytz
echo $(pwd)
python $SCRIPTPATH/action.py

#echo bye bye!
#echo "::set-output name=test_out::aaaabbbbcccc"
#echo "::set-output name=hash_v3::v33333"
#echo "::set-output name=hash_v4::v44444"


