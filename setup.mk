# THIS MAKFILE IS GENERATED

PACKAGES = resource-manager vxlan evpn

NETWORK = create-network packages/ncs-5.7.3-cisco-nx.5.22.13.tar.gz 3 LFND-  \
          create-network packages/ncs-5.7.3-cisco-nx.5.22.13.tar.gz 2 BRLFND-

.PHONY: netsim netsim-clean netsim-start netsim-stop
netsim:
	if [ ! -d netsim ]; then \
		mkdir netsim; \
		ncs-netsim --dir netsim $(NETWORK); \
		ncs-netsim ncs-xml-init > ncs-cdb/netsim_devices_init.xml; \
	fi

netsim-clean:
	rm -rf netsim
	rm -rf ncs-cdb/netsim_devices_init.xml

netsim-start:
	ncs-netsim start

netsim-stop:
	[ -d netsim ] && ncs-netsim stop || true

.PHONY: packages packages-clean
packages:
	(for i in $(PACKAGES); do \
	        $(MAKE) -C packages/$${i}/src all || exit 1; \
	done)

packages-clean:
	(for i in $(PACKAGES); do \
	        $(MAKE) -C packages/$${i}/src clean || exit 1; \
	done)

