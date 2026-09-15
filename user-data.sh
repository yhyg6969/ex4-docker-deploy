#!/bin/bash
aws ecr get-login-password --region eu-west-3 | \
  docker login --username AWS --password-stdin 925047940866.dkr.ecr.eu-west-3.amazonaws.com

mkdir -p /home/ec2-user/nginx/html
chown -R ec2-user:nginx /home/ec2-user/nginx

aws s3 sync s3://std14-website-s3/html/ /home/ec2-user/nginx/html/ --delete
aws s3 cp s3://std14-website-s3/nginx/default.conf /home/ec2-user/nginx/default.conf
aws s3 cp s3://std14-website-s3/docker-compose.yaml /home/ec2-user/docker-compose.yaml

cd /home/ec2-user
docker compose pull
docker compose up -d --remove-orphans
docker image prune -f