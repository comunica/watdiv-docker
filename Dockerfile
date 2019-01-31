FROM buildpack-deps:jessie

# Install requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
		cmake \
		libboost-all-dev \
	&& rm -rf /var/lib/apt/lists/*

# Download source
RUN cd /opt \
    && curl -LO https://dsg.uwaterloo.ca/watdiv/watdiv_v06.tar \
    && tar -xvf watdiv_v06.tar \
    && rm watdiv_v06.tar

# Compile
ENV BOOST_HOME /usr/lib/
RUN cd /opt/watdiv \
    && make

# Default command
ENTRYPOINT ["/opt/watdiv/bin/Release/watdiv"]
CMD ["--help"]
