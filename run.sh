#!/bin/bash

main()
{
    echo "Start!"
    echo "The number of parameters is: $#"
    echo "All parameters are: $@"

    if [ "$1" = "all" ]; then
        rm -rf ./build/*
        cmake -B build .
        make -C build
    elif [ "$1" = "lll" ]; then
        cmake -B build .
        make -C build
    fi
    echo "Finished!"
}



main $@

