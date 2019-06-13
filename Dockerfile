FROM r-base:3.6.0

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -y && \
    apt-get install -y libpq-dev && \
    Rscript -e 'install.packages("RPostgreSQL")' && \
    Rscript -e 'install.packages("tidyverse")' && \
    Rscript -e 'install.packages("knitr")' && \
    Rscript -e 'install.packages("markdown")' && \
    Rscript -e 'install.packages("rmarkdown")' && \
    Rscript -e 'install.packages("RCurl")' && \
    Rscript -e 'install.packages("ggthemes")' && \
    Rscript -e 'install.packages("webshot")' && \
    Rscript -e 'install.packages("lubridate")' && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
