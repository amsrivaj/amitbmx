#!/bin/bash
set -e

apt-get update
apt-get install bc


round()
{
    echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
}

KS_MEMORY=128Mi
MEMORY=`echo ${KS_MEMORY} | sed 's/Mi//g' | sed 's/Gi/*1024/g'`
KS_MEMORY_LIMIT=`bc -l <<< "${MEMORY} * 1.3"`
KS_MEMORY_LIMIT=$(round $KS_MEMORY_LIMIT 0)
KS_MEMORY_LIMIT="${KS_MEMORY_LIMIT}Mi"

KS_CPU_LIMIT=0.7

echo "current directory is "
pwd

export KS_MEMORY=

#APP_NAME
sed -i "s/#KS_APP_NAME#/app/g" /workspace/output/kube-deploy.yaml

#KS_INGRESS_LARGE_CLIENT_HEADER_BUFFERS
sed -i "s/#KS_INGRESS_LARGE_CLIENT_HEADER_BUFFERS#/4 16k/g" /workspace/output/kube-deploy.yaml

#KS_HEALTH_SCHEME
sed -i "s/#KS_HEALTH_SCHEME#/HTTP/g" /workspace/output/kube-deploy.yaml

#KS_CLUSTER_SUBDOMAIN
sed -i "s/#KS_CLUSTER_SUBDOMAIN#/saashub-next-gen-test-7543ffbb0026f72e4c4bdf341a6ee84a-0000/g" /workspace/output/kube-deploy.yaml

#KS_REGION
sed -i "s/#KS_REGION#/us-south/g" /workspace/output/kube-deploy.yaml

#KS_APP_PORT
sed -i "s/#KS_APP_PORT#/3737/g" /workspace/output/kube-deploy.yaml

#KS_INSTANCES
sed -i "s/#KS_INSTANCES#/2/g" /workspace/output/kube-deploy.yaml

#KS_SECRET_NAME
sed -i "s/#KS_SECRET_NAME#/saashub-next-gen-test-7543ffbb0026f72e4c4bdf341a6ee84a-0000/g" /workspace/output/kube-deploy.yaml

#KS_MEMORY
sed -i "s/#KS_MEMORY#/128Mi/g" /workspace/output/kube-deploy.yaml

#KS_CPU
sed -i "s/#KS_CPU#/0.01/g" /workspace/output/kube-deploy.yaml

#KS_HEALTH_ROUTE
sed -i "s/#KS_HEALTH_ROUTE#/\//g" /workspace/output/kube-deploy.yaml

#KS_HEALTH_DELAY
sed -i "s/#KS_HEALTH_DELAY#/20/g" /workspace/output/kube-deploy.yaml

#KS_HEALTH_TIMEOUT
sed -i "s/#KS_HEALTH_TIMEOUT#/2/g" /workspace/output/kube-deploy.yaml

#KS_HEALTH_INTERVAL
sed -i "s/#KS_HEALTH_INTERVAL#/11/g" /workspace/output/kube-deploy.yaml

#KS_LIVENESS_ROUTE
sed -i "s/#KS_LIVENESS_ROUTE#/\//g" /workspace/output/kube-deploy.yaml

#KS_LIVENESS_TIMEOUT
sed -i "s/#KS_LIVENESS_TIMEOUT#/15/g" /workspace/output/kube-deploy.yaml

#KS_LIVENESS_INTERVAL
sed -i "s/#KS_LIVENESS_INTERVAL#/310/g" /workspace/output/kube-deploy.yaml

#KS_LIVENESS_THRESHOLD
sed -i "s/#KS_LIVENESS_THRESHOLD#/3/g" /workspace/output/kube-deploy.yaml

KS_MEMORY_LIMIT

#KS_MEMORY_LIMIT
sed -i "s/#KS_MEMORY_LIMIT#/$KS_MEMORY_LIMIT/g" /workspace/output/kube-deploy.yaml

#KS_CPU_LIMIT
sed -i "s/#KS_CPU_LIMIT#/$KS_CPU_LIMIT/g" /workspace/output/kube-deploy.yaml
