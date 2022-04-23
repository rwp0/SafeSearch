# run with sudo(1)

use v5.32;
use warnings;

use File::Copy qw();
use File::Spec; # class

my $dnsmasq = File::Spec -> catdir('/', 'etc', 'NetworkManager', 'dnsmasq.d'); # Network Manager (Debian)
my $hosts = File::Spec -> catdir('/', 'etc', 'NetworkManager', 'hosts.d');

mkdir $hosts
  if not -e $hosts;

File::Copy::copy('./etc/safesearch.hosts', $hosts); # google safesearch
File::Copy::copy('./etc/hosts.dnsmasq.conf', $dnsmasq); # read above
File::Copy::copy('./etc/server.dnsmasq.conf', $dnsmasq); # set CF nameservers

opendir(my $directory, $dnsmasq); # create dirhandle
say $_
  for readdir($directory); # list

system('systemctl restart NetworkManager.service');

# https://perldoc.perl.org/File::Copy

# If the destination (second argument) already exists and is a directory, and the source (first argument) is not a filehandle, then the source file will be copied into the directory specified by the destination, using the same base name as the source file. It's a failure to have a filehandle as the source when the destination is a directory.
