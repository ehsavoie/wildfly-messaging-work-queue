#!/usr/bin/env bash
echo "Executing configure-amq-rar.cli"
$JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/extensions/configure-amq-rar.cli
echo "Copying rar"
cp resource-adapter-1.0.0.rar $JBOSS_HOME/standalone/deployments/.
