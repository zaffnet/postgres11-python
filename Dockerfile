FROM python:3.7.9


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-11 \
    && rm -rf /var/lib/apt/lists/*


RUN usermod -aG sudo postgres
RUN usermod -aG sudo postgres

USER postgres


ENV PATH="/var/lib/postgresql/.local/bin:${PATH}"
