podman pull haproxy:alpine3.15
podman pod rm HAProxyTest -f
podman image list haproxy_server | awk '{print $3}' | tail -n +2 | xargs podman image rm  -f

podman-compose up -d
