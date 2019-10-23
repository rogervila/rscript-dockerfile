FROM r-base:3.6.1

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update -y && \
    apt-get install -y libssh2-1-dev libmariadbclient-dev libgit2-dev unzip pandoc pandoc-citeproc \
    cargo libmagick++-dev libssl-dev libcurl4-openssl-dev libpq-dev r-cran-rjava locales && \
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
    sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen && \
    echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc && \
    echo "export LANG=en_US.UTF-8" >> ~/.bashrc && \
    echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc && \
    source ~/.bashrc && \
    mkdir -p /usr/lib/rstudio/bin/pandoc/ && \
    ln -s /usr/bin/pandoc /usr/lib/rstudio/bin/pandoc/pandoc && \
    ln -s /usr/bin/pandoc-citeproc /usr/lib/rstudio/bin/pandoc/pandoc-citeproc && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
