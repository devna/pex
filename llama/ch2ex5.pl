#!perl -w

print "Please input string: ";
$str = <STDIN>;
print "Please input repetition times: ";
chomp($times = <STDIN>);
$repe_str = $str x $times;
print "The result of $times repetitions is:\n$repe_str";