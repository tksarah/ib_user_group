#!/bin/perl

# Initialize
my $ac = "uid\@corpnt.corp.co.jp";
my $pw = "password";
my $host = "192.168.0.100";		  # LDAP Server	
my $dc = "dc=corpnt,dc=corp,dc=co,dc=jp"; # Example dc

# Group hash
my %dephash = (
	"1234" => "Dep1",
	"5678" => "Dep2",
	);

foreach my $key ( keys(%dephash) ) {
	my $obj = "\'(&(objectclass=user)(extensionAttribute2=$key))\'";
	my $ret = `ldapsearch -x -LLL -o ldif-wrap=no -D $ac -w $pw -h $host -b $dc $obj |grep '^distinguishedName' | cut -d' ' -f2 | base64 -d`;

	foreach my $user (split( /CN=/ , $ret )){
		my ($id) = $user =~ m/^(.*)_.*$/;
		my $id6 = substr($id,-6,6);
		my ($name) = $user =~ m/^.*_(.*),OU=User.*$/;

		if($id ne ""){ print "$id6,$dephash{$key},$name\n"; }
		}
	}

exit(0);
