#!/usr/bin/perl

# This program provides all the combinations of change (pennies, nickels,
# dimes, quarters) for a given amount. There is a dynamic programming 
# solution to this problem but this is not an implementation using that
# method. 

# 1. requires variables to be declared, local not accepted this
#    merly redeclares an existing variable. 
# 2. disable symbolic references use of variables to name variables.
# 3. bareword identifiers, where bareword not quoted can be a string or
#    and identifier. 
use strict;
use warnings;
use Readonly;

my $PENNY = .01;
my $NICKEL = .05;
my $DIME = .10;
my $QUARTER = .25;

my $CHANGE = 3.23;
my $total = 0;

for (my $quarters = 0; $quarters < ($CHANGE/$QUARTER); $quarters++)
{
    for (my $dimes = 0; $dimes < ($CHANGE/$DIME); $dimes++)
    {
	for (my $nickels = 0; $nickels < ($CHANGE/$NICKEL); $nickels++)
	{
	    my $sum = ($quarters*$QUARTER)+ ($dimes*$DIME)+ ($nickels*$NICKEL);
	    if ($sum <= $CHANGE)
	    {
		my $pennies = int(($CHANGE - $sum)*100+.5);
		print "quarters: $quarters dimes: $dimes nickels: $nickels pennies: $pennies\n"; 
		$total++;
	    }
        }
    }
}

print "total combinations: $total\n";

