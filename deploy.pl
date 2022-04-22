# run with sudo(1)

use v5.32;
use warnings;

use File::Copy qw();

my $dnsmasq = '/etc/NetworkManager/dnsmasq.d'; # Network Manager (Debian)

File::Copy('safesearch.hosts', $dnsmasq);
File::Copy('server.dnsmasq.conf', $dnsmasq);

# https://perldoc.perl.org/File::Copy

# If the destination (second argument) already exists and is a directory, and the source (first argument) is not a filehandle, then the source file will be copied into the directory specified by the destination, using the same base name as the source file. It's a failure to have a filehandle as the source when the destination is a directory.
