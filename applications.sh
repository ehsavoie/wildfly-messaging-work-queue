oc replace --force  -f  \
https://raw.githubusercontent.com/jboss-container-images/jboss-amq-7-broker-openshift-image/72-1.3.GA/amq-broker-7-image-streams.yaml
oc replace --force -f \
https://raw.githubusercontent.com/jboss-container-images/jboss-amq-7-broker-openshift-image/72-1.3.GA/amq-broker-7-scaledown-controller-image-streams.yaml
oc replace --force -n openshift -f https://raw.githubusercontent.com/openshift-s2i/s2i-wildfly/master/imagestreams/wildfly-centos7.json
oc import-image amq-broker-72-openshift:1.3

oc apply -f ./service.yaml



oc new-app --template=wildfly-messaging-work-queue-frontend \
  -p SOURCE_REPOSITORY_URL=https://github.com/ehsavoie/wildfly-messaging-work-queue \
  -p SOURCE_REPOSITORY_REF=master \
  -p SOURCE_REPOSITORY_DIR=frontend \
  -p CONTEXT_DIR=frontend \
  -p ARTIFACT_DIR=frontend/target


oc new-app --template=wildfly-messaging-work-queue-worker \
  -p SOURCE_REPOSITORY_URL=https://github.com/ehsavoie/wildfly-messaging-work-queue \
  -p SOURCE_REPOSITORY_REF=master \
  -p SOURCE_REPOSITORY_DIR=worker \
  -p CONTEXT_DIR=worker \
  -p ARTIFACT_DIR=worker/target
