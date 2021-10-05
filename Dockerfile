FROM mysql

WORKDIR /app
COPY dump.sh /app/dump.sh
RUN mkdir /dump

ENTRYPOINT /app/dump.sh