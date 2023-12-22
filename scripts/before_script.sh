#!/bin/bash
set -x
echo "** nitesh-api-prod process status **" >> "/tmp/nitesh-api-prod_deploy_logs"
runuser -l root -c 'sudo pm2 status' | grep -wo sample
if [  $? -ne 0 ];
then
   echo "############################## pm2 not running #################################" >> /tmp/nitesh-api-prod_deploy_logs
else
   echo "############################## pm2 already running Deleting ####################" >> /tmp/nitesh-api-prod_deploy_logs
    runuser -l root -c 'sudo pm2 delete sample'
fi

rm -rf /home/ubuntu/nitesh

if [ ! -d /home/ubuntu/nitesh ]; then
runuser -l ubuntu -c 'mkdir -p /home/ubuntu/nitesh' >> /tmp/nitesh-prod_deploy_logs
fi
