
default[:zookeeper][:group] = "zookeeper"
default[:zookeeper][:user] = "zookeeper"

default[:zookeeper][:conf_dir] = '/etc/zookeeper/conf'
default[:zookeeper][:data_dir] = '/var/lib/zookeeper'
default[:zookeeper][:log_dir] = '/var/log/zookeeper'

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

