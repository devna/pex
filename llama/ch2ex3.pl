#!perl -w

$pi = 3.141592657;
print "Please input radius of circle: ";
chomp($radius = <STDIN>);
if($radius < 0) {
	$radius = 0;
}
$circ = 2 * $pi * $radius;
print "The circumference of a circle of radius $radius is $circ.\n";