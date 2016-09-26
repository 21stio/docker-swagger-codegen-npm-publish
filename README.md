#### description

generates a sdk from a swagger.(yaml|json), fetches the latest version of the packge from npm, increments the version and publishes the package to npm

#### usage

```bash
docker run \
	-v $(pwd)/swagger.yaml:/swagger.yaml \
	-e NPM_PACKAGE_NAME=whatever
	-e CODEGEN_SWAGGER_FILE=/swagger.yaml \
	-e CODEGEN_LANGUAGE=typescript-fetch \
	-e NPM_AUTH_TOKEN=23d3-e4d4-.... \
	-e NPM_EMAIL=what@ever.io \
	21stio/swagger-codegen-npm-publish
```
