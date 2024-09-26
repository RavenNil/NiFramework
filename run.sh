#!/bin/bash

# treat unset var as an error
set -o nounset

echo_info() { echo -e "\e[32;40m $* \e[0m"; }
echo_err() { echo -e "\e[41;37m $* \e[0m"; }
echo_warn() { echo -e "\e[43;37m $* \e[0m"; }

VendorList=("IMX6ULL" "LOCAL");
VENDOR="LOCAL"
set_vendor()
{
    for name in ${VendorList[@]}
    do
        if [ ${name} == $1 ]; then
            VENDOR=$1
            echo_info "found vendor ${VENDOR}"
            return 0;
        fi
    done
    echo_err "ERR! not found any vendor called $1"
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
    echo_info "$0 -d [ release | debug ] -v [ LOCAL | IMX6ULL ] -n [ all | lll | test ]"

    echo "VENDOR is ${VENDOR}"
    echo "Supported VENDOR: "
    echo_info "${VendorList[@]}"

    echo "ACTION is ${ACTION}"
    echo "Supported ACTION: "
    echo_info  "${ActionList[@]}"

    echo "COMPILE_MODE is ${COMPILE_MODE}"
    echo "Supported COMPILE_MODE: "
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

    # if [ $# -eq 0 ]; then
    #     tomb;
    #     exit 1;
    # fi

    while [ $# -gt 0 ]
    do
        case "$1" in
        -v) set_vendor $2;
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
    [ -z ${VENDOR} ] || [ -z ${COMPILE_MODE} ] || [ -z ${ACTION} ] && {
        echo_err "options loss!"
        [ -z ${VENDOR} ] && { echo_err "loss vendor option"; }
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

    if [ ${VENDOR} == "IMX6ULL" ]; then
        cmakeCmd="${cmakeCmd} -DCMAKE_TOOLCHAIN_FILE=./vendor/arm64/imx6ull.cmake"
    elif [ ${VENDOR} == "LOCAL" ]; then
        # do nothing use pc toolchains
        cmakeCmd="${cmakeCmd}"
    else
        echo_warn "unknown vendor"
    fi
    cmakeCmd="${cmakeCmd} -DVENDOR:STRING=${VENDOR}"

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

