dnl Autoconf configure script for hyperion

dnl Process this file with autoconf to produce a configure script.

AC_INIT(src/hyperion.ads)

AC_CANONICAL_SYSTEM
dnl AM_MAINTAINER_MODE

# Current release settings
HYPERION_MAJOR_VERSION=0
HYPERION_MINOR_VERSION=1
HYPERION_MICRO_VERSION=0
HYPERION_VERSION=$HYPERION_MAJOR_VERSION.$HYPERION_MINOR_VERSION.$HYPERION_MICRO_VERSION
AM_GNAT_CHECK_GPRBUILD
# checking for local tools

AC_PROG_MAKE_SET
AC_PROG_INSTALL
AC_PROG_LN_S

# Set the version number of the project
AC_SUBST(HYPERION_VERSION)
AC_SUBST(HYPERION_MAJOR_VERSION)
AC_SUBST(HYPERION_MINOR_VERSION)
AC_SUBST(HYPERION_MICRO_VERSION)

EXEC_PREFIX="$prefix"
AC_SUBST(EXEC_PREFIX)
HYPERION_LIBDIR="lib"
AC_SUBST(HYPERION_LIBDIR)

AC_MSG_CHECKING([number of processors])
NR_CPUS=`getconf _NPROCESSORS_CONF 2>/dev/null || getconf NPROCESSORS_CONF 2>/dev/null || echo 1`
AC_MSG_RESULT($NR_CPUS)
AC_SUBST(NR_CPUS)
##########################################
# Check to enable/disable shared library
##########################################
AM_SHARED_LIBRARY_SUPPORT

##########################################
# Ada Util library
##########################################
AM_GNAT_FIND_PROJECT([ada-util],[Ada Utility Library],[utilada_sys],
  [git@github.com:stcarrez/ada-util.git],
  [Building hyperion requires the Ada Utility Library.],
  [
    UTIL_DIR=${gnat_project_dir_utilada_sys}
  ])
AC_SUBST(UTIL_DIR)

##########################################
# Ada Expression Language library
##########################################
AM_GNAT_FIND_PROJECT([ada-el],[Ada Expression Language Library],[elada],
  [git@github.com:stcarrez/ada-el.git],
  [Building hyperion requires the Ada EL Library.],
  [
    EL_DIR=${gnat_project_dir_elada}
  ])
AC_SUBST(EL_DIR)

##########################################
# Ada Servlet library
##########################################
AM_GNAT_FIND_PROJECT([ada-servlet],[Ada Servlet],[servletada],
  [git@github.com:stcarrez/ada-servlet.git],
  [Building hyperion requires the Ada Servlet Library.],
  [
    SERVLET_DIR=${gnat_project_dir_servletada}
  ])
AC_SUBST(SERVLET_DIR)

##########################################
# Ada Server Faces library
##########################################
AM_GNAT_FIND_PROJECT([ada-asf],[Ada Server Faces],[asf],
  [git@github.com:stcarrez/ada-asf.git],
  [Building hyperion requires the Ada Server Faces Library.],
  [
    ASF_DIR=${gnat_project_dir_asf}
  ])
AC_SUBST(ASF_DIR)

##########################################
# Ada Security library
##########################################
AM_GNAT_FIND_PROJECT([ada-security],[Ada Security Library],[security],
  [git@github.com:stcarrez/ada-security.git],
  [Building hyperion requires the Ada Security Library.],
  [
    SECURITY_DIR=${gnat_project_dir_security}
  ])
AC_SUBST(SECURITY_DIR)

##########################################
# Ada Swagger library
##########################################
AM_GNAT_FIND_PROJECT([swagger-ada],[Swagger Ada Library],[swagger],
  [git@github.com:stcarrez/swagger-ada.git],
  [Building Hyperion requires the Ada Swagger Library.],
  [
    SERVLET_DIR=${gnat_project_dir_swagger}
  ])
AC_SUBST(SWAGGER_DIR)

##########################################
# Ada Database Objects library
##########################################
AM_GNAT_FIND_PROJECT([ada-ado],[Ada Database Objects],[ado],
  [git@github.com:stcarrez/ada-ado.git],
  [Building hyperion requires the Ada Database Objects Library.],
  [
    ADO_DIR=${gnat_project_dir_ado}
  ])
AC_SUBST(ADO_DIR)

##########################################
# Ada Wiki library
##########################################
AM_GNAT_FIND_PROJECT([ada-wiki],[Ada Wiki],[wikiada],
  [git@github.com:stcarrez/ada-wiki.git],
  [Building hyperion requires the Ada Wiki Library.],
  [
    WIKI_DIR=${gnat_project_dir_wikiada}
  ])
AC_SUBST(WIKI_DIR)

##########################################
# Ada Web Application library
##########################################
AM_GNAT_FIND_PROJECT([ada-awa],[Ada Web Application],[awa],
  [git@github.com:stcarrez/ada-awa.git],
  [Building hyperion requires the Ada Web Application Library.],
  [
    AWA_DIR=${gnat_project_dir_awa}
  ])
AC_SUBST(AWA_DIR)

AM_UTIL_CHECK_INSTALL
AC_OUTPUT(
Makefile hyperion.gpr rules.mk
)
