dnl Macro para detectar wxWidgets
dnl Baseado no original wxwin.m4 do wxWidgets

AC_DEFUN([AM_OPTIONS_WXCONFIG],
[
   AC_ARG_WITH(wx-config,
   [[  --with-wx-config=FILE     Use the given path to wx-config when determining
                            wxWidgets configuration; defaults to "wx-config"]],
   [
       if test "$withval" != "yes" -a "$withval" != ""; then
           WX_CONFIG_PATH=$withval
       fi
   ])

   AC_ARG_WITH(wx-prefix,
   [[  --with-wx-prefix=PREFIX   Prefix where wxWidgets is installed (optional)]],
   wx_config_prefix="$withval", wx_config_prefix="")

   AC_ARG_WITH(wx-exec-prefix,
   [[  --with-wx-exec-prefix=PREFIX
                          Exec prefix where wxWidgets is installed (optional)]],
   wx_config_exec_prefix="$withval", wx_config_exec_prefix="")
])

AC_DEFUN([AM_PATH_WXCONFIG],
[
  if test x$wx_config_exec_prefix != x ; then
     wx_config_args="$wx_config_args --exec-prefix=$wx_config_exec_prefix"
     WX_LOOKUP_PATH="$wx_config_exec_prefix/bin"
  fi
  if test x$wx_config_prefix != x ; then
     wx_config_args="$wx_config_args --prefix=$wx_config_prefix"
     WX_LOOKUP_PATH="$WX_LOOKUP_PATH:$wx_config_prefix/bin"
  fi

  dnl check if wx-config exists
  AC_PATH_PROG(WX_CONFIG_WITH_ARGS, wx-config, no, [$WX_LOOKUP_PATH:$PATH])

  if test "$WX_CONFIG_WITH_ARGS" = "no" ; then
     ifelse([$2], , :, [$2])
  else
     WX_CPPFLAGS="`$WX_CONFIG_WITH_ARGS $wx_config_args --cppflags`"
     WX_CXXFLAGS="`$WX_CONFIG_WITH_ARGS $wx_config_args --cxxflags`"
     WX_CFLAGS="`$WX_CONFIG_WITH_ARGS $wx_config_args --cflags`"
     WX_LIBS="`$WX_CONFIG_WITH_ARGS $wx_config_args --libs`"
     WX_CXXFLAGS_ONLY="`$WX_CONFIG_WITH_ARGS $wx_config_args --cxxflags | sed 's/-D[[^ ]]*//g'`"
     WX_CFLAGS_ONLY="`$WX_CONFIG_WITH_ARGS $wx_config_args --cflags | sed 's/-D[[^ ]]*//g'`"
     wx_config_major_version=`$WX_CONFIG_WITH_ARGS $wx_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
     wx_config_minor_version=`$WX_CONFIG_WITH_ARGS $wx_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
     wx_config_micro_version=`$WX_CONFIG_WITH_ARGS $wx_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`

     wx_requested_major_version=`echo $1 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
     wx_requested_minor_version=`echo $1 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
     wx_requested_micro_version=`echo $1 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`

     wx_ver_ok=""
     if test "x$wx_requested_major_version" = "x"; then
        wx_ver_ok=yes
     else
        if test $wx_config_major_version -gt $wx_requested_major_version; then
           wx_ver_ok=yes
        else
           if test $wx_config_major_version -eq $wx_requested_major_version; then
              if test $wx_config_minor_version -gt $wx_requested_minor_version; then
                 wx_ver_ok=yes
              else
                 if test $wx_config_minor_version -eq $wx_requested_minor_version; then
                    if test $wx_config_micro_version -ge $wx_requested_micro_version; then
                       wx_ver_ok=yes
                    fi
                 fi
              fi
           fi
        fi
     fi

     if test "x$wx_ver_ok" = "x"; then
        ifelse([$2], , :, [$2])
     else
        AC_SUBST(WX_CPPFLAGS)
        AC_SUBST(WX_CXXFLAGS)
        AC_SUBST(WX_CFLAGS)
        AC_SUBST(WX_LIBS)
        ifelse([$3], , :, [$3])
     fi
  fi
])
