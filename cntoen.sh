#!/bin/bash
q=`cat <<EOF 
$1
EOF`
from=zh
to=en
appid=20181029000226645
salt=123456
key=kT1M8aSyZ32M1FAg5jka
sign=`echo -n "$appid$q$salt$key" | md5sum`
sign=`echo $sign|awk '{print $1}'`
post="q=$q&from=$from&to=$to&appid=$appid&salt=$salt&sign=$sign"
a=`curl -s http://api.fanyi.baidu.com/api/trans/vip/translate -X POST -d "$post"`
a=${a#*dst\":\"}
a=${a%%\"*}
echo -e $q:$a
echo -e $q:$a >> /test/english.txt
#curl http://api.fanyi.baidu.com/api/trans/vip/translate -X POST -d "q=$q&from=$from&to=$to&appid=$appid&salt=$salt&sign=$sign"
