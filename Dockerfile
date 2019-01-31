FROM buildpack-deps:jessie

# Install requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
		cmake \
		libboost-all-dev \
        wamerican \
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
WORKDIR /opt/watdiv/bin/Release/

# Add convenience generator
ADD generate-bulk.sh /opt/watdiv/bin/Release/generate-bulk.sh

# Default command
ENTRYPOINT ["./generate-bulk.sh"]
CMD ["-s 1 -q 5 -r 1"]
