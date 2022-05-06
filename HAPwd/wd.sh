. wd.conf

serverList=""
for i in `curl --silent -H "Authorization: ApiKey ${API_KEY}" https://$HAP_URL/_cat/nodes?h=id,http | awk '{ print $1 ";;" $2}'`;
  do
    echo $i
    serverList="${serverList};;;;server ${i} ${SERVER_CONF}\n";
  done

cp wd.serverList wd.serverList.prv
echo -e $serverList | sed '/^[[:space:]]*$/d' > wd.serverList

mdPrv=`md5sum wd.serverList.prv | awk '{print $1}'`
mdNow=`md5sum wd.serverList     | awk '{print $1}'`

if [[ $mdPrv != $mdNow ]]; then
  export hapdef=`echo -e ${serverList} |sed '/^[[:space:]]*$/d' | sed 's/;;/ /g'`
  envsubst < haproxy.cfg.template > haproxy.cfg
  echo "new server list"
  cp haproxy.cfg $HAP_CFG_FILE
  bash -c "${HAP_RESTARTER}"
else
  echo "no changes to server list"
fi

rm wd.serverList.prv
