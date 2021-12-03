FROM python:3.7.9


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-11 \
    && rm -rf /var/lib/apt/lists/*


USER postgres

RUN usermod -G root user1


ENV PATH="/var/lib/postgresql/.local/bin:${PATH}"
