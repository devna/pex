#!perl -w

$pi = 3.141592657;
print "Please input radius of circle: ";
chomp($radius = <STDIN>);
$circ = 2 * $pi * $radius;
print "The circumference of a circle of radius $radius is $circ.\n";