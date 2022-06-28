# CLUS-EVPN
## NSO EVPN project for Cisco Live US 2017, updated to work with latest NSO 5.7.x images & NEDs

This Cisco NSO project contains the following packages:
- EVPN Package
    - Implements customer-facing EVPN services:
        - evpn-l3-direct  - Connectivity to evpn leaf nodes with L3 termination and use of
                            anycast-gateway
        - evpn-l3-default - Connectivity to evpn leaf nodes with L3 termination using
                            static routes or BGP
        - evpn-l2-vpls    - Connectivity to evpn leaf nodes with L2 extending to the DCI,
                            connecting to customer VPLS instance on the DCI
        - evpn-l2-evpl    - Connectivity to evpn leaf nodes with L2 extending to the DCI,
                            connecting to customer EVPL instance on the DCI
    - These services call VXLAN services in order to build the corresponding Layer-2 or
      Layer-3 topology.

- VXLAN Package
    - Implements VXLAN services:
        - routed-topology - VXLAN Layer-3 topology
        - bridged-topology - VXLAN Layer-2 topology

The following additional packages are required:
- Cisco NX-OS NED - ncs-5.7.3-cisco-nx-5.22.13.tar.gz
- Cisco resource-manager - ncs-5.7.4-resource-manager-3.5.7.tar.gz

Run the following commands after a new install (or after a make clean) *in the active ncs directory*:

    $ make all                              -- initialize netsim devices and ncs cdb
    $ make start                            -- start netsim testbed and ncs
    $ make cli					            -- connect to nso cli
    admin@ncs# devices fetch-ssh-host-keys
    admin@ncs# devices sync-to	            -- update netsim devices configuration with initial cdb data
    admin@ncs# devices sync-to	            -- yes, need to do it twice

Before pushing the project to git, remember to clean temporary data:

    $ make stop
    $ make clean

Recommended environment:
- NSO 5.7.x
- Python 3.6.6

This has been tested with Python 2.7.14 and 3.6.6.

If using Python 2.7.14, the following pip packages need to be installed:
- ipaddress
- future
