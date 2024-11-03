#!/bin/bash

# treat unset var as an error
set -o nounset

echo_info() { echo -e "\e[32;40m $* \e[0m"; }
echo_err() { echo -e "\e[41;37m $* \e[0m"; }
echo_warn() { echo -e "\e[43;37m $* \e[0m"; }

ActionList=("all" "lll" "test")
ACTION="lll"
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

THREAD_NUM=16
set_thread_num()
{
    THREAD_NUM=$1
    return 0;
}

guide()
{
    echo_info "$0 -d [ release | debug ] -n [ all | lll | test ]"

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
    #     guide;
    #     exit 1;
    # fi

    while [ $# -gt 0 ]
    do
        case "$1" in
        -h|--help|help) guide; 
            exit 0;;
        -t) set_thread_num $2;
            shift 2;;
        -n) set_action $2;
            [ $? -eq 1 ] && { guide; exit 1;}
            shift 2;;
        -d) set_complie_mode $2;
            [ $? -eq 1 ] && { guide; exit 1;}
            shift 2;;
        --) shift
            break;;
        *) echo_err "Internel Err! "; exit 1;;
        esac
    done

    # 检查参数是否有效
    [ -z ${COMPILE_MODE} ] || [ -z ${ACTION} ] && {
        echo_err "options loss!"
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

