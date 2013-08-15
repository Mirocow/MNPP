#/bin/sh

export TMPDIR=/tmp

__show_usage( ) {
 
  echo "Usage: ${0} {start|stop|restart}"
  exit 3
}

__set_privilegies( ) { 
   sudo chown -R mysql:mysql /Applications/MNPP/run/mysql
   sudo chown -R mysql:mysql /Applications/MNPP/Library/mysql
   sudo chmod -R 755 /Applications/MNPP/Library/mysql/*
   sudo chmod 644 /Applications/MNPP/conf/mysql/my.cnf
   sudo rm /Applications/MNPP/Library/mysql/my.cnf
   sudo ln -s /Applications/MNPP/conf/mysql/my.cnf /Applications/MNPP/Library/mysql/my.cnf
}

__start( ){
  __set_privilegies
  /Applications/MNPP/Library/mysql/support-files/mysql.server start  
}

__stop( ){
  /Applications/MNPP/Library/mysql/support-files/mysql.server stop  
}

case "${1}" in
    start)
          __start
        ;;
    stop)
          __stop
        ;;
    restart)
          __stop && __start
        ;;
    *)
        __show_usage
        ;;
esac

