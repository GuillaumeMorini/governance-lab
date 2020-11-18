#!/usr/bin/env bash

REGISTRY=$(yq r $PARAMS_YAML commonSecrets.harborDomain)
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/projects -H "Content-type: application/json" --data @harbor/project/build-service.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/projects -H "Content-type: application/json" --data @harbor/project/catalog.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/projects -H "Content-type: application/json" --data @harbor/project/petclinic.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/projects -H "Content-type: application/json" --data @harbor/project/concourse.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/projects -H "Content-type: application/json" --data @harbor/project/tools.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/registries -H "Content-type: application/json" --data @harbor/registry/gcr.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/registries -H "Content-type: application/json" --data @harbor/registry/bitnami.json
GITHUB_REGISTRY=$(jq -n --arg githubUser $(yq r $PARAMS_YAML commonSecrets.githubUser) --arg githubToken $(yq r $PARAMS_YAML commonSecrets.githubToken) "$(cat ./harbor/registry/github.json)")
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/registries -H "Content-type: application/json" --data @harbor/registry/github.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/registries -H "Content-type: application/json" --data @harbor/registry/hub.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/replication/policies -H "Content-type: application/json" --data @harbor/replication/toolkit.json
curl --user "admin:${HARBOR_PASSWORD}" -X POST https://${REGISTRY}/api/v2.0/replication/policies -H "Content-type: application/json" --data @harbor/replication/catalog.json