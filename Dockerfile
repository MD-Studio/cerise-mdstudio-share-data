FROM mdstudio/cerise:develop
MAINTAINER  Felipe Zapata <f.zapata@esciencecenter.nl>

COPY api /home/cerise/api
RUN chown -R cerise:cerise /home/cerise/api

VOLUME /home/cerise/api
