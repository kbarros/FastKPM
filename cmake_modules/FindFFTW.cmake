# FFTW_INCLUDE_DIR = fftw3.h
# FFTW_LIBRARIES = libfftw3.a
# FFTW_FOUND = true if FFTW3 is found

IF(FFTW_INCLUDE_DIRS)
  FIND_PATH(FFTW_INCLUDE_DIR fftw3.h ${FFTW_INCLUDE_DIRS})
  FIND_LIBRARY(FFTW_LIBRARY fftw3 ${FFTW_LIBRARY_DIRS})
ELSE(FFTW_INCLUDE_DIRS)
    SET(TRIAL_PATHS
      /opt/fftw-3.2/usr/include
      /usr/include
    )
    SET(TRIAL_LIBRARY_PATHS
      /opt/fftw-3.2/usr/lib64
      /usr/lib
      /usr/lib64
      )
    FIND_PATH(FFTW_INCLUDE_DIR fftw3.h ${TRIAL_PATHS})
    FIND_LIBRARY(FFTW_LIBRARY fftw3 ${TRIAL_LIBRARY_PATHS})
ENDIF(FFTW_INCLUDE_DIRS)
set(FFTW_INCLUDE_DIRS ${FFTW_INCLUDE_DIR} )
set(FFTW_LIBRARIES ${FFTW_LIBRARY} )

IF(FFTW_INCLUDE_DIR AND FFTW_LIBRARIES)
  MESSAGE(STATUS "FFTW_INCLUDE_DIR=${FFTW_INCLUDE_DIR}")
  MESSAGE(STATUS "FFTW_LIBRARIES=${FFTW_LIBRARIES}")
  SET(FFTW_FOUND TRUE)
ELSE()
  MESSAGE("FFTW NOT found.")
  SET(FFTW_FOUND FALSE)
ENDIF()

MARK_AS_ADVANCED(
   FFTW_INCLUDE_DIR
   FFTW_LIBRARIES
   FFTW_FOUND
)
