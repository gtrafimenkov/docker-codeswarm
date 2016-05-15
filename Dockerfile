FROM ubuntu:14.04.4

MAINTAINER gennady.trafimenkov@gmail.com

RUN apt-get update \
 && apt-get install -y default-jdk ant \
 && apt-get install -y git subversion mercurial bzr \
 && apt-get install -y wget \
 && apt-get install -y unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/codeswarm/source-archive.zip

RUN unzip source-archive.zip \
  && cd codeswarm/trunk \
  && ant build \
  && ant jar

ADD extra-scripts /codeswarm/trunk

RUN cd /codeswarm/trunk \
  && ./prepare-configs.sh

ENTRYPOINT ["/codeswarm/trunk/visualize-repo.sh"]
