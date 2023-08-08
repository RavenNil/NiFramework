#!/bin/bash

# treat unset var as an error
set -o nounset

echo_info() { echo -e "\e[32;40m $* \e[0m"; }
echo_err() { echo -e "\e[41;37m $* \e[0m"; }
echo_warn() { echo -e "\e[43;37m $* \e[0m"; }

PlatformList=("IMX6ULL" "AUTO");
PLATFORM=""
set_platform()
{
    for name in ${PlatformList[@]}
    do
        if [ ${name} == $1 ]; then
            PLATFORM=$1
            echo_info "found platform ${PLATFORM}"
            return 0;
        fi
    done
    echo_err "ERR! not found any platform called $1"
    return 1;
}

ActionList=("all" "lll" "test")
ACTION="all"
set_action()
{
    for name in ${ActionList[@]}
    do
        if [ ${name} == $1 ]; then
            ACTION=$1
            echo_info "found action ${ACTION}"
            return 0;
        fi

    done
    echo_err "ERR! not found any action called $1"
    return 1;
}

CompileModeList=("release" "debug")
COMPILE_MODE="debug"
set_complie_mode()
{
    for name in ${CompileModeList[@]}
    do
        if [ ${name} == $1 ]; then
            COMPILE_MODE=$1
            echo_info "found compilemode is ${COMPILE_MODE}"
            return 0;
        fi

    done
    echo_err "ERR! not found any compile mode called $1"
    return 1;
}

tomb()
{
    echo_info "$0 -d [release|debug] -p [IMX6ULL|AUTO] -n [all|lll|test]"

    echo "PLATFORM is ${PLATFORM}"
    echo "Supported PLATFORM have:"
    echo_info "${PlatformList[@]}"

    echo "ACTION is ${ACTION}"
    echo "Supported ACTION have:"
    echo_info  "${ActionList[@]}"

    echo "COMPILE_MODE is ${COMPILE_MODE}"
    echo "Supported COMPILE_MODE have:"
    echo_info  "${CompileModeList[@]}"

    return 0;
}

main()
{
    echo_info "Start!"
    # echo_info "The number of parameters is: $#"
    # echo_info "All parameters are: $@"

    cmakeCmd="cmake -B build "
    makeCmd="make -C build -j8 "

    while [ $# -gt 0 ]
    do
        case "$1" in
        -p) set_platform $2;
            [ $? -eq 1 ] && { tomb; exit 1;}
            shift 2;;
        -n) set_action $2;
            [ $? -eq 1 ] && { tomb; exit 1;}
            shift 2;;
        -d) set_complie_mode $2;
            [ $? -eq 1 ] && { tomb; exit 1;}
            shift 2;;
        --) shift
            break;;
        *) echo_err "Internel Err! "; exit 1;;
        esac
    done

    # 检查参数是否有效
    [ -z ${PLATFORM} ] || [ -z ${COMPILE_MODE} ] || [ -z ${ACTION} ] && {
        echo_err "options loss!"
        [ -z ${PLATFORM} ] && { echo_err "loss platform option"; }
        [ -z ${COMPILE_MODE} ] && { echo_err "loss compile mode option"; }
        [ -z ${ACTION} ] && { echo_err "loss action option"; }
        exit 1;
    }

    if [ ${COMPILE_MODE} == "release" ]; then
        cmakeCmd="${cmakeCmd} -DCMAKE_BUILD_TYPE=Release"
    elif [ ${COMPILE_MODE} == "debug" ]; then
        cmakeCmd="${cmakeCmd} -DCMAKE_BUILD_TYPE=Debug"
    else
        echo_warn "unknown compile mode"
    fi

    if [ ${PLATFORM} == "IMX6ULL" ]; then
        cmakeCmd="${cmakeCmd} -DCMAKE_TOOLCHAIN_FILE=./platform/arm64/imx6ull.cmake"
    elif [ ${PLATFORM} == "AUTO" ]; then
        # do nothing use pc toolchains
        cmakeCmd="${cmakeCmd}"
    else
        echo_warn "unknown paltform"
    fi
    cmakeCmd="${cmakeCmd} -DPLATFORM:STRING=${PLATFORM}"

    echo_info "CMake cmd: ${cmakeCmd}"

    if [ "${ACTION}" = "all" ]; then
        /usr/bin/rm -rf ./build/*
        ${cmakeCmd}
        ${makeCmd}
    elif [ "${ACTION}" = "lll" ]; then
        ${cmakeCmd}
        ${makeCmd}
    fi
    echo "Finished!"
}



main $*

