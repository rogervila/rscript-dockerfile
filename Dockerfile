FROM r-base:3.6.1

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -y && \
    apt-get install -y libpq-dev r-cran-rjava && \
    Rscript -e 'install.packages("RPostgreSQL")' && \
    Rscript -e 'install.packages("tidyverse")' && \
    Rscript -e 'install.packages("knitr")' && \
    Rscript -e 'install.packages("markdown")' && \
    Rscript -e 'install.packages("rmarkdown")' && \
    Rscript -e 'install.packages("RCurl")' && \
    Rscript -e 'install.packages("ggthemes")' && \
    Rscript -e 'install.packages("webshot")' && \
    Rscript -e 'install.packages("lubridate")' && \
    Rscript -e 'install.packages("RJDBC")' && \
    Rscript -e 'install.packages("tidyverse")' && \
    Rscript -e 'download.file("http://s3.amazonaws.com/redshift-downloads/drivers/RedshiftJDBC41-1.1.9.1009.jar","RedshiftJDBC41-1.1.9.1009.jar")' && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
