# Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42)

# We can also use

(10..100).cover?(42)

# These methods yield the same value 'true' for arguments 10, 42 and 100.