FROM blacktop/elasticsearch:6.8

# RUN echo "vm.max_map_count = 262144" > /etc/sysctl.conf
# RUN sysctl -w vm.max_map_count=262144
RUN echo 262144 > /proc/sys/vm/max_map_count
# RUN echo "vm.max_map_count=262144" | tee -a /etc/sysctl.conf
# RUN sysctl -p
# RUN sysctl -w vm.max_map_count=262144

/bin/sh

