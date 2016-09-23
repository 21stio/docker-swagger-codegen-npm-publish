#!/usr/bin/env sh

set -e

if [ "$1" = '-h' ]  || [ -z ${NPM_EMAIL+x} ] || [ -z ${NPM_AUTH_TOKEN+x} ] || [ -z ${NPM_PACKAGE_NAME+x} ] || [ -z ${CODEGEN_SWAGGER_FILE+x} ] || [ -z ${CODEGEN_LANGUAGE+x} ]; then
	echo "environment variables NPM_EMAIL, NPM_AUTH_TOKEN, NPM_PACKAGE_NAME, CODEGEN_SWAGGER_FILE and CODEGEN_LANGUAGE need to be set"
	exit
fi

CURRENT_NPM_PACKAGE_VERSION=$(npm view ${NPM_PACKAGE_NAME} version 2>/dev/null || echo "0.0.0")
NEW_NPM_PACKAGE_VERSION=$(/./increment_version.sh -p ${CURRENT_NPM_PACKAGE_VERSION})

java -jar swagger-codegen-cli.jar generate --input-spec ${CODEGEN_SWAGGER_FILE} --lang ${CODEGEN_LANGUAGE} --output /sdk --additional-properties npmName=${NPM_PACKAGE_NAME}

cd /sdk
npm version ${NEW_NPM_PACKAGE_VERSION}

echo //registry.npmjs.org/:_authToken=${NPM_AUTH_TOKEN} > ~/.npmrc

npm publish