
FROM mdillon/postgis

# install postgresql-plpython, needed by deepdive 
RUN apt-get update \
 && apt-get install -y postgresql-server-dev-${PG_MAJOR} postgresql-plpython-${PG_MAJOR} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo 'PGPASSWORD="$POSTGRES_PASSWORD" psql -U $POSTGRES_USER template1 -c "CREATE EXTENSION plpythonu;"' >/docker-entrypoint-initdb.d/plpythonu.sh
