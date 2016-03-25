#!/usr/bin/perl

#
# Traverse a Matrix by circling the outer edges moving inward until
# the center is reached. 
#
# travel x forward, y
# travel x , y forward 
# travel x backward, y 
# travel x , y backward
#
sub SwirlTraversal
{
    my $n = $_[0];
    my $m = $_[1];

    my $x = 0;
    my $y = 0;

    # total squares to traverse
    $v = $n*$m;
    
    while ($v > 0)
    { 
	# Use x and y to track the column and rows visited. 
	my $xf = $x;
	my $yf = $y;   

	print "\nForward X\n";
        # starting at 0,0 traverse the x coordinates. 
	for ( ; $xf < $n - $x ; $xf++)
        {
	    print "($xf,$yf),";
	    $v--;
        }
	$xf--; # adjust from for-loop
        # we moved x forward we need to advance one 
        # in the y direction to move down.  
	$yf++; 

	print "\nForward Y\n";
	# starting at the x coordinate last traversed, and y+1 
        # traverse the y coordinates. 
	for ( ; $yf < $m - $y ; $yf++)
        {
	    print "($xf,$yf),";
	    $v--;
	}
	$yf--; # adjust from the for-loop

	# traverse moving backwards using xb, adjust 
	# one location back in x direction from the
	# last traversal which was down. 
 	my $xb = $xf -1 ;
	print "\nBackwards X\n";

        for ( ; $xb >= $x; $xb--)
        {
	    print "($xb,$yf),";
	    $v--;
        }
	$xb++; # adjust from for-loop

	print "\n";

        # traverse moving upwards using yb, adjust
	# one location up in the y direction from the 
	# last traversal which was left. 
	my $yb = $yf - 1;
	print "\nBackwards Y\n";
        for ( ; $yb > $y; $yb--)
        {
	    print "($xb,$yb),";
	    $v--;
        }

	# update number of rows, columns traversed
	$x++;
	$y++;
	
    }
}

#
# Traverse a matrix by starting in the lower left
# corner and moving diaganolly back and forth.
#
sub DiaganolZigZagTraversal
{
    my $n = $_[0];
    my $m = $_[1];

    # strating position lower left most 
    # coordinate.
    my $x = 0;
    my $y = $m-1;

    # direction of traversal
    # +1 forward
    # -1 negaive
    $direction = 1; 
    

    # total diaganols to zigzag
    $rows = $n + $m -1 ;

    while ( $rows > 0 )
    {
	# forward direction
	print "\nForward direction\n";

	$bLoop = 1;

	do 
	{
	    print "($x,$y),";
	    
	    if ($x+1  == $n)
            {
		$y--;
		$bLoop = 0;
		
	    } elsif ($y+1 == $m)
	    {
		$x++;
		$bLoop = 0;
	    }

	    if ($bLoop == 1)
	    {
		$x++;
		$y++;
	    }

	} while ( $bLoop == 1);

	$rows--;

	if ($rows == 0)
	{
	    last;
	}
	
	# backward direction
	print "\nBackward direction\n";

	$bLoop = 1;
	do 
	{
	    print("($x,$y),");

	    if ($y == 0)
	    {
		$x++;
		$bLoop = 0;
	    }
	    elsif ($x == 0)
            {
		$y--;
		$bLoop = 0;
	    } 


	    if ($bLoop == 1)
	    {
		$x--;
		$y--;
	    }

  	} while ( $bLoop == 1); 
 
	$rows--;
    }
    print "\n";
}

$M = 4;
$N = 4;

SwirlTraversal($M,$N);

DiaganolZigZagTraversal($M,$N);

