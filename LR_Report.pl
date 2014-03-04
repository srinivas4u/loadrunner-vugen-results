#!/usr/bin/perl


print "Please enter the file Name: ";

$filename = <STDIN>;
chomp($filename);

open(F,"$filename.txt");

print "Please enter the file outputfile Name: ";

$fileout = <STDIN>;
chomp($fileout);

open(F2,">>$fileout.xls");

@line = <F>;

$y = scalar(@line);

print "Transation Name\tResponse Time\tThink Time\tWasted Time\n";

print F2 "Transation Name\tResponse Time\tThink Time\tWasted Time\n";

for ($i=0;$i<=$y ;$i++) {

@line1 = grep(/ended with /,@line);

$line1[$i] =~ s/ Notify: Transaction \"//g;

$line1[$i] =~ s/\" ended with \"Pass\" status //g;

$line1[$i] =~ s/\(//g;

$line1[$i] =~ s/\)\.//g;

$line1[$i] =~ s/://g;

$line1[$i] =~ s/.*?\)//g;

$line1[$i] =~ s/Duration /\t/g;

$line1[$i] =~ s/ Think Time /\t/g;

$line1[$i] =~ s/ Wasted Time /\t\t/g;

print $line1[$i];
chomp($line1[$i]);
print F2 "$line1[$i]\n";
	
}

close(F);
close(F2);



