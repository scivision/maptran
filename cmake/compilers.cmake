set(CMAKE_CONFIGURATION_TYPES "Release;RelWithDebInfo;Debug" CACHE STRING "Build type selections" FORCE)

if(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
  if(WIN32)
    add_compile_options(/QxHost)
    string(APPEND CMAKE_Fortran_FLAGS " /traceback /warn /heap-arrays")
  else()
    add_compile_options(-xHost)
    string(APPEND CMAKE_Fortran_FLAGS " -traceback -warn -heap-arrays")
  endif()
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  string(APPEND CMAKE_Fortran_FLAGS " -fimplicit-none")
  string(APPEND CMAKE_Fortran_FLAGS_DEBUG " -fcheck=all -Werror=array-bounds")
  # -march=native is not for all CPU arches with GCC.
  add_compile_options(-mtune=native -Wall -Wextra)
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL NAG)
  string(APPEND CMAKE_Fortran_FLAGS " -f2018 -C -colour -gline -nan -info -u")
endif()
