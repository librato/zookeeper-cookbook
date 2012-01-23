
default[:zookeeper][:group] = "zookeeper"
default[:zookeeper][:user] = "zookeeper"

default[:zookeeper][:conf_dir] = '/etc/zookeeper'
default[:zookeeper][:data_dir] = '/var/lib/zookeeper'
default[:zookeeper][:log_dir] = '/var/log/zookeeper'

default[:zookeeper][:max_heap] = "512m"

default[:zookeeper][:version] = "3.3.4"
default[:zookeeper][:checksum] = "de698d412c4b0ed5230aec9c4412045803f09ba0a0f7839c707a22809d2dbce9"
# Must confirm to $URL/zookeeper-<version>/zookeeper-<version>.tar.gz
default[:zookeeper][:mirror] = "http://mirrors.ibiblio.org/apache/zookeeper/"

default[:zookeeper][:tick_time] = 2000
default[:zookeeper][:init_limit] = 10
default[:zookeeper][:sync_limit] = 5
default[:zookeeper][:client_port] = 2181
default[:zookeeper][:quorum_port] = 2888
default[:zookeeper][:leader_elect_port] = 3888
default[:zookeeper][:max_client_connections] = 30

# Set to the global list of server IPs.
#
default[:zookeeper][:servers] = nil

# XXX: This must be set to the integer index (zero-based)
# in the servers list.
#
default[:zookeeper][:myid] = nil

