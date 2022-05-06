# podman-haproxy-for-es-plus-wd
HAProxy for elasticsearch via podman, WD to update config
Made this to pre-test HAP live configuration updates and try to make elastic-elasticsearch-cluster easier by automating HaProxy Load Balancer.

## First Instance:
**Edit:** ./HAPwd/wd.conf and HAPwd/haproxy.cfg.template
**Run:** ./HAPwd/wd.sh

## Create/Start Container:
**Run:** ./start.sh

## Update haproxy.cfg nodes list:
**Run:** ./HAPwd/wd.sh 
