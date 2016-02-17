FROM pcp-docker-containers.bintray.io/pcp-base:latest
MAINTAINER Henry Chang

RUN dnf -y install supervisor pcp pcp-collector pcp-webapi && dnf clean all

RUN . /etc/pcp.conf && echo "-A" >> $PCP_PMCDOPTIONS_PATH
RUN . /etc/pcp.conf && echo OPTIONS=\"\$OPTIONS -S\" >> $PCP_PMWEBDOPTIONS_PATH
COPY ./supervisord.conf /etc/supervisord.conf
ENV PATH /usr/share/pcp/lib:/usr/libexec/pcp/bin:$PATH
CMD ["/usr/bin/supervisord"]
