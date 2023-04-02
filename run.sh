#!/bin/bash

main()
{
    echo "Start!"
    echo "The number of parameters is: $#"
    echo "All parameters are: $@"

    cmakeCmd="cmake -B build "
    makeCmd="make -C build -j8 "

    if [ "$1" = "all" ]; then
        rm -rf ./build/*
        ${cmakeCmd}
        ${makeCmd}
    elif [ "$1" = "lll" ]; then
        ${cmakeCmd}
        ${makeCmd}
    fi
    echo "Finished!"
}



main $@

