#!perl -w

print "Please input first number: ";
chomp($num1 = <STDIN>);
print "Please input second number: ";
chomp($num2 = <STDIN>);
$product = $num1 * $num2;
print "The product of $num1 and $num2 is $product.\n";