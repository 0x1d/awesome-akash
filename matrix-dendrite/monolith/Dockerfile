FROM matrixdotorg/dendrite-monolith:v0.10.7
RUN apk add gettext
COPY dendrite.yaml.tpl /var/dendrite/template/
COPY run.sh /
ENTRYPOINT [ "sh", "/run.sh" ]