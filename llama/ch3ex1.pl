#!perl -w

print "Please input strings(one string per line, Control-Z for end):\n";
@lines = <STDIN>;
print "Reversed lines:\n";
print reverse @lines;