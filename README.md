# infrastructure-keepalived
A container for running keepalived. This should run in a container with host
networking enabled. It can be used to load balance two or more hosts. Before
using you must set these values in your sysctl configuration:

    net.ipv4.ip_nonlocal_bind = 1
    net.ipv6.ip_nonlocal_bind = 1

You may also have to allow VRRP over your firewall between the two hosts. There
are thousands of guides for using keepalived out there but this is not one of
those.
