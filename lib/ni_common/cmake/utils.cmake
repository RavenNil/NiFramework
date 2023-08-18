
macro(nicmake_list_source_directories srcs)                                                                                              
    unset(tmp)                                                                                                                   
    foreach(dir ${ARGN})                                                                                                         
        aux_source_directory(${dir} tmp)                                                                                         
    endforeach()                                                                                                                 
    set(${srcs} ${tmp})                                                                                                          
    list(FILTER ${srcs} EXCLUDE REGEX ".*_test\\.c")                                                                             
endmacro()
