#!/bin/bash

###########################################################
# This scripts aims to initialize the running environment #
# for repository <workFlowRec>, including:                     #
#    ● gather correponding binary to target dir           #
#    ● generate init script                               #
#    ● generate modulefile                                #
# --------------------------------------------------------#
# by Roadelse                                             #
#                                                         #
# 2024-03-26    rebuild                                   #
###########################################################

#@ <prepare>
#@ <.depVars>  dependent variables
myDir=$(cd $(dirname "${BASH_SOURCE[0]}") && readlink -f .)
curDir=$PWD

#@ <.pre-check>
#@ <..python>
if [[ -z $(which python3 2>/dev/null) ]]; then
    echo '\033[31m'"Error! Cannot find python interpreter"'\033[0m'
    exit 200
fi

#@ <.arguments>
#@ <..default>
binary_dir=${PWD}/bin
setenvfile=${PWD}/load.workFlowRec.sh
modulefile=${PWD}/workFlowRec
profile=
#@ <..resolve>
while getopts "b:s:m:p:" arg; do
    case $arg in
    b)
        binary_dir=$OPTARG
        ;;
    s)
        setenvfile=$OPTARG
        ;;
    m)
        modulefile=$OPTARG
        ;;
    p)
        profile=$OPTARG
        ;;
    esac
done

#@ <.header> create header for setenv and module files
cat <<EOF >$setenvfile
#!/bin/bash

EOF

cat <<EOF >$modulefile
#%Module 1.0

EOF

#@ <core>
# <.binary> organize executable
mkdir -p $binary_dir && cd $_
ln -sf $(realpath $myDir/../bin/wf) wf

# <.setenv>
cat <<EOF >$setenvfile
#!/bin/bash

export PATH=${binary_dir}:\$PATH
alias iwf='source wf'

EOF

cat <<EOF >$modulefile
#%Module 1.0

prepend-path PATH ${binary_dir}
set-alias iwf "source wf"

EOF

#@ <post> modify profile
cd $curDir
set -e
if [[ -n $profile ]]; then
    read -p "profile detected, which way to init rdeeToolkit? [setenv|module] default:module " sm
    if [[ -z $sm ]]; then
        sm=module
    fi

    # echo "sm=$sm"

    if [[ $sm == "module" ]]; then
        moduledir=$(dirname $modulefile)
        cat <<EOF >>.temp
# >>>>>>>>>>>>>>>>>>>>>>>>>>> [reSync]
module use $moduledir
module load workFlowRec

EOF
        python3 $myDir/txtop.ra-nlines.py $profile .temp
        rm -f .temp
    elif [[ $sm == "setenv" ]]; then
        cat <<EOF >>.temp
# >>>>>>>>>>>>>>>>>>>>>>>>>>> [reSync]
source $setenvfile

EOF
        python3 $myDir/txtop.ra-nlines.py $profile .temp
        rm -f .temp
    else
        echo "Unknown input: $sm"
        exit 200
    fi
fi
