FROM r-base:3.6.1

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -y && \
    apt-get install --no-install-recommends -y libssh2-1-dev libmariadbclient-dev libgit2-dev \
    cargo libmagick++-dev libssl-dev libcurl4-openssl-dev libpq-dev r-cran-rjava && \
    Rscript -e 'install.packages("RPostgreSQL", dependencies=TRUE)' && \
    Rscript -e 'install.packages("knitr", dependencies=TRUE)' && \
    Rscript -e 'install.packages("markdown", dependencies=TRUE)' && \
    Rscript -e 'install.packages("rmarkdown", dependencies=TRUE)' && \
    Rscript -e 'install.packages("RCurl", dependencies=TRUE)' && \
    Rscript -e 'install.packages("ggthemes", dependencies=TRUE)' && \
    Rscript -e 'install.packages("webshot", dependencies=TRUE)' && \
    Rscript -e 'install.packages("lubridate", dependencies=TRUE)' && \
    Rscript -e 'install.packages("RJDBC", dependencies=TRUE)' && \
    Rscript -e 'install.packages("dplyr", dependencies=TRUE)' && \
    Rscript -e 'install.packages("tidyverse", dependencies=TRUE)' && \
    Rscript -e 'download.file("http://s3.amazonaws.com/redshift-downloads/drivers/RedshiftJDBC41-1.1.9.1009.jar","RedshiftJDBC41-1.1.9.1009.jar")' && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
