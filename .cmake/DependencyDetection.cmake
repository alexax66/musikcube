macro(find_vendor_library target_var library_name)
    find_library(${target_var} NAMES ${library_name} PATHS ${VENDOR_LINK_DIRECTORIES} NO_DEFAULT_PATH NO_CACHE)
    message(STATUS "[dependency-detection] ${BoldBlue}'${library_name}' library resolved to '${${target_var}}'${ColorReset}")
endmacro(find_vendor_library)

macro(find_header header_name)
    find_path(TEMP ${header_name} HINTS ${PROJECT_INCLUDE_DIRECTORIES} REQUIRED NO_CACHE)
    if (${TEMP} MATCHES "TEMP-NOTFOUND")
        message(STATUS "[dependency-detection] ${BoldRed}'${header_name}' COULD NOT BE FOUND!${ColorReset}")
    else()
        message(STATUS "[dependency-detection] ${BoldBlue}'${header_name}' resolved to '${TEMP}'${ColorReset}")
    endif()
    unset(TEMP)
endmacro(find_header)

macro(find_library_and_header target_var library_name header_name)
    find_library(${target_var} NAMES ${library_name} NO_CACHE)
    message(STATUS "[dependency-detection] ${BoldBlue}'${library_name}' library resolved to '${${target_var}}'${ColorReset}")
    find_header(${header_name})
endmacro(find_library_and_header)
