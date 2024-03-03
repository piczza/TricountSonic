#!/usr/bin/env bash

PROJECT_NAME=TricountSonic
BUILD_REPO=/home/ec2-user/deploy
JAR_NAME=$(basename $BUILD_REPO/*.jar)

LOG_PATH=/home/ec2-user/log
DEPLOY_LOG="$LOG_PATH/deploy.log"

echo "> current pid check" >> $DEPLOY_LOG
CURRENT_PID=$(pgrep -f "$JAR_NAME")

if [ -z "$CURRENT_PID" ]
then
  echo "> nothing to shut down." >> $DEPLOY_LOG
else
  echo "> kill -15 $CURRENT_PID" >> $DEPLOY_LOG
  kill -15 "$CURRENT_PID"
fi