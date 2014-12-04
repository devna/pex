#!perl -w

print "Please input strings(one string per line, Control-Z for end):\n";
@lines = <STDIN>;
print "Sorted lines(one string per line):\n";
print sort @lines;

chomp @lines;
@lines = sort @lines;
print "Sorted lines(all in one line):\n";
print "@lines";