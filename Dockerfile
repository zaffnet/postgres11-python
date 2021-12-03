FROM python:3.7.9


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-11 \
    && rm -rf /var/lib/apt/lists/*
    
    
RUN apt-get update -qy
RUN apt-get install -qy bash curl python

RUN curl -sSL https://sdk.cloud.google.com | bash -s -- --disable-prompts
RUN ln -s /root/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
RUN ln -s /root/google-cloud-sdk/bin/gsutil /usr/bin/gsutil
RUN ln -s /root/google-cloud-sdk/bin/docker-credential-gcloud /usr/bin/docker-credential-gcloud


RUN usermod -aG sudo postgres
RUN usermod -aG root postgres

USER postgres


ENV PATH="/var/lib/postgresql/.local/bin:${PATH}"
