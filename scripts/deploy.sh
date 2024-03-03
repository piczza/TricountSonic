#!/usr/bin/env bash

PROJECT_NAME=TricountSonic
BUILD_REPO=/home/ec2-user/deploy
JAR_NAME=$(basename $BUILD_REPO/*.jar)

LOG_PATH=/home/ec2-user/log
APP_LOG="$LOG_PATH/Applications.log"
ERROR_LOG="$LOG_PATH/deploy-error.log"
DEPLOY_LOG="$LOG_PATH/deploy.log"

echo "> build file name: $JAR_NAME" >> $DEPLOY_LOG

DEPLOY_PATH=/home/ec2-user/deploy
cp "$BUILD_REPO/$JAR_NAME" $DEPLOY_PATH

echo "main branch deploy \n" >>/home/ec2-user/log/deploy.log

DEPLOY_JAR=$DEPLOY_PATH/$JAR_NAME
chmod +x "$DEPLOY_JAR"

echo "> $DEPLOY_JAR start deploy" >> $DEPLOY_LOG
nohup java -jar -Dspring.profiles.active="$PROFILES_ACTIVE" "$DEPLOY_JAR" >> $APP_LOG 2> $ERROR_LOG &