FROM java:8-jdk-alpine

RUN apk update
RUN apk add ca-certificates wget
RUN apk add --no-cache nodejs
RUN apk add --no-cache bash
RUN npm install -g typescript
RUN npm install -g typings

RUN wget https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.1/swagger-codegen-cli-2.2.1.jar -O /swagger-codegen-cli.jar

RUN wget https://raw.githubusercontent.com/21stio/shell-semver/master/increment_version.sh -O /increment_version.sh
RUN chmod +x /increment_version.sh

COPY ./cmd.sh /cmd.sh
RUN chmod +x /cmd.sh

CMD bash /cmd.sh