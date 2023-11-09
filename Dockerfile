# https://fast-dds.docs.eprosima.com/en/latest/installation/sources/sources_linux.html
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install libasio-dev libtinyxml2-dev -y
RUN apt-get install cmake -y
RUN apt-get install build-essential -y
RUN apt-get install git -y
RUN apt-get install python3 -y
COPY Fast-CDR /Fast-CDR
RUN cd /Fast-CDR && mkdir build && cd build && cmake .. && cmake --build . --target install
COPY foonathan_memory_vendor /foonathan_memory_vendor
RUN cd /foonathan_memory_vendor && mkdir build && cd build && cmake .. && cmake --build . --target install
COPY Fast-RTPS /Fast-RTPS
RUN cd /Fast-RTPS && mkdir build && cd build && cmake .. -DCOMPILE_EXAMPLES=ON -DPERFORMANCE_TESTS=ON && cmake --build . --target install
