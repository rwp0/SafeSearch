# run as SUDO

# Special variables
SHELL = /bin/sh

# Custom variables
HOSTS_FILE = /etc/hosts
SAFESEARCH_FILE = GoogleSafeSearch.hosts

## Grep assertion to not duplicate the appending
#$(shell grep '216\.239\.38\.120' $(HOSTS_FILE) > /dev/null 2>&1)
#ifeq "$(.SHELLSTATUS)" '0'
#  $(error SafeSearch hosts already exists in the hosts file)
#endif

.PHONY: install hblock clean

.DEFAULT_GOAL = install


install: hblock
	$(info Installing Google SafeSearch hosts)
	@ sh -c "cat $(SAFESEARCH_FILE) >> $(HOSTS_FILE)"

hblock: clean
	$(info Installing hblock hosts (be patient))
	@ hblock > /dev/null 2>&1

clean:
	$(info Removing $(HOSTS_FILE) file)
	@ rm -vf $(HOSTS_FILE)
