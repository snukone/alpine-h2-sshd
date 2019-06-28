FROM openjdk:jre-alpine

ENV DOWNLOAD http://www.h2database.com/h2-2018-03-18.zip
ENV DATA_DIR /opt/h2-data

COPY h2.server.properties /root/.h2.server.properties

RUN apk add --no-cache curl unzip

RUN mkdir -p ${DATA_DIR} \
    && curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip

COPY launch.sh ${DATA_DIR}

RUN apk add --update --no-cache openssh \
	&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  	&& echo "root:root" | chpasswd

EXPOSE 22 81 1521

ENTRYPOINT [ "sh", "-c", "/opt/h2-data/launch.sh" ]