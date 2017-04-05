########### JAVA_HOME for Tomcat SETTING#########
export JAVA_HOME=/usr/java/java8_64

########################## APM PINPOINT Setting ########################################
#export PINPOINT_AGENT_PATH=/usr/local/pinpoint-agent
#export CATALINA_OPTS="$CATALINA_OPTS -javaagent:$PINPOINT_AGENT_PATH/pinpoint-bootstrap-1.6.1-SNAPSHOT.jar"
#export CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.agentId=apm-agent"
#export CATALINA_OPTS="$CATALINA_OPTS -Dpinpoint.applicationName=erpdev-apm"

CATALINA_OPTS="${CATALINA_OPTS} -Dlogback.configurationFile=${CATALINA_HOME}/conf/logback.xml"
#CATALINA_OPTS="$CATALINA_OPTS -Djava.rmi.server.hostname=xxx.xxx.xxx.xxx"
export LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/usr/local/apr/lib'
 

#log directory
SERVER_NAME="tomcat"
LOG_HOME="/home/lab/tomcat/logs"
GC_LOG_HOME="${LOG_HOME}/gclog"

#log file
DATE_TIME=`date +'%y%m%d'`
#DATE_TIME=`%d{yyyyMMdd}`
GC_LOG_FILENM="gclog.${DATE_TIME}"

JAVA_OPTS="${JAVA_OPTS} -server"
JAVA_OPTS="${JAVA_OPTS} -D${SERVER_NAME}"
JAVA_OPTS="${JAVA_OPTS} -Xms256m -Xmx512m -XX:+HeapDumpOnOutOfMemoryError"
JAVA_OPTS="${JAVA_OPTS} -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC"
JAVA_OPTS="${JAVA_OPTS} -Djava.security.egd=file:///dev/urandom"
JAVA_OPTS="${JAVA_OPTS} -verbosegc -Xloggc:${GC_LOG_HOME}/${GC_LOG_FILENM}"
export JAVA_OPTS CATALINA_OPTS
