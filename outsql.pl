#!/bin/perl

# You shuold check user id , group id and default course before runing this script
#
# Initialize
my $pw = "5dc6faaf498f5a3d2d0b82002cd9966b8c3df570"; # "password"
my $wfile="userinput.sql";
my $cnt = 10;


open(W,">./$wfile");
	open(R,"<./listfile.txt");
	while(<R>){
		my @list = split(/,/,$_);
		chomp($list[2]);
		print W "insert into ib_users(id,username,password, name, role) values ($cnt,\'$list[0]\',\'$pw\','$list[2]','user')\;\n";
		print W "insert into ib_users_courses(user_id, course_id) values ($cnt,4)\;\n";

		if ($list[1] eq "Dep1"){
			print W "insert into ib_users_groups(user_id,group_id) values($cnt,1)\;\n";
		}elsif ($list[1] eq "Dep2"){
			print W "insert into ib_users_groups(user_id,group_id) values($cnt,2)\;\n";
		}
		print W "\n";
		$cnt++;
	}
	close(R);
close(W);

exit(0);
