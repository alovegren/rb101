famous_words = "seven years ago..."

"Four score and " << famous_words
# This mutates the "Four score and " string but not the strong contained in famous_words

famous_words.prepend("Four score and ")
# This mutates the string contained in famous_words