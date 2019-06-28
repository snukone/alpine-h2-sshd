 #!/bin/ash

exec java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server -web -webAllowOthers -webPort 81 -tcp -tcpAllowOthers -tcpPort 1521 -baseDir /opt/h2-data &
ssh-keygen -A
exec /usr/sbin/sshd -D
