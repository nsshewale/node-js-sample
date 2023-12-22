#!/bin/bash
set -x
chown -R root:ubuntu /home/ubuntu/nitesh/
echo  "***Installing npm package ***" >> /tmp/nitesh-api-prod_deploy_logs
echo >> /tmp/nitesh-api-prod_deploys_logs
#runuser -l ubuntu -c 'cd /home/ubuntu/nitesh && npm install'
#runuser -l ubuntu -c 'cd /home/ubuntu/nitesh && npm install --unsafe-perm'
#runuser -l ubuntu -c 'cd /home/ubuntu/nitesh && npm run build'
sleep 10
echo "***starting sample-backend-admin-api-prod application ***" >> /tmp/nitesh-api-prod_deploy_logs
runuser -l ubuntu -c 'cd /home/ubuntu/nitesh && sudo pm2 start dist/src/server.js --name sample  --silent' >> /tmp/nitesh-api-prod_deploy_logs
s1=`pm2 status | grep -we sample | awk '{print $12}'`
sleep 5
s2=`pm2 status | grep -we sample | awk '{print $12}'`
if [ $s1 == $s2 ]
then
echo "BUILD SUCCESSFUL" >> /tmp/nitesh-api-prod_deploy_logs
echo >> /tmp/nitesh-api-prod_deploy_logs
else
echo "Node process is restarting" >> /tmp/nitesh-api-prod_deploy_logs
echo >> /tmp/nitesh-api-prod_deploy_logs
fi
