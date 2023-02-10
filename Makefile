# run as SUDO

# Special variables
SHELL = /bin/sh
.DEFAULT_GOAL = install

# Custom variables
HOSTS_FILE = /etc/hosts
SAFESEARCH_FILE = GoogleSafeSearch.hosts

.PHONY: install hblock clean

install: hblock
	$(info Installing Google SafeSearch hosts)
	@ cat $(SAFESEARCH_FILE) >> $(HOSTS_FILE)

hblock: clean
	$(info Installing hblock hosts (be patient))
	@ hblock > /dev/null 2>&1

clean:
	$(info Removing $(HOSTS_FILE) file)
	@ rm -vf $(HOSTS_FILE)
