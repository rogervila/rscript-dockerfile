FROM r-base:3.6.1

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -y && \
    apt-get install -y libssh2-1-dev libmariadbclient-dev libgit2-dev unzip pandoc pandoc-citeproc \
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
    wget --quiet --no-check-certificate -O /tmp/pandoc.zip https://s3.amazonaws.com/rstudio-buildtools/pandoc-1.13.1.zip && \
    unzip -j /tmp/pandoc.zip "pandoc-1.13.1/linux/debian/x86_64/pandoc" -d /opt/pandoc && \
    chmod +x /opt/pandoc/pandoc && \
    ln -s /opt/pandoc/pandoc /usr/local/bin && \
    unzip -j /tmp/pandoc.zip "pandoc-1.13.1/linux/debian/x86_64/pandoc-citeproc" -d /opt/pandoc && \
    chmod +x "/opt/pandoc/pandoc-citeproc" && \
    ln -s "/opt/pandoc/pandoc-citeproc" /usr/local/bin && \
    locale-gen en_US && \
    mkdir -p /usr/lib/rstudio/bin/pandoc/ && \
    ln -s /usr/bin/pandoc /usr/lib/rstudio/bin/pandoc/pandoc && \
    ln -s /usr/bin/pandoc-citeproc /usr/lib/rstudio/bin/pandoc/pandoc-citeproc
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
