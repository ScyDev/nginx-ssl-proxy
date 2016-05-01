#!/bin/bash
cp /usr/src/docker-registry.conf /tmp/docker-registry.conf
abc=$(sed "s/<docker_registry_ip>/${REGISTRY_PORT_5000_TCP_ADDR}/g;s/<target_port>/${REGISTRY_TARGET_PORT}/g;s/<public_ip>/${PUBLIC_IP_ADDR}/g" /tmp/docker-registry.conf)
echo "$abc" > /etc/nginx/conf.d/docker-registry.conf

cp /usr/src/default.conf /tmp/default.conf
xyz=$(sed "s/<docker_registry_ip>/${REGISTRY_PORT_5000_TCP_ADDR}/g;s/<target_port>/${REGISTRY_TARGET_PORT}/g;s/<public_ip>/${PUBLIC_IP_ADDR}/g" /tmp/default.conf)
echo "$xyz" > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
