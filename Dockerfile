FROM rasa/rasa:latest-full

COPY app /app
COPY rasaserver.sh /app/rasaserver.sh

USER root

RUN pip3 install recognizers-text-suite
RUN pip3 install requests
RUN rasa train
RUN chmod a+rwx /app/rasaserver.sh

ENTRYPOINT ["/app/rasaserver.sh"]