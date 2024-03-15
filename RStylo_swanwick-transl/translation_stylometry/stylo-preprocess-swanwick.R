
library(xml2)
library(tm)
library(stringr)

xmlFaustEN <- read_xml("data- swanwick/faust1-en.xml")

faustEN <- xml_text(xml_find_all(xmlData, ".//WORD"), trim = "false")
faustEN <- paste(faustEN, collapse = ' ')
faustEN <- gsub('(.*) DEDICATION.','', faustEN)
faustEN <- gsub('The Hamilton, Locke (.*)', '', faustEN)
faustEN <- removeNumbers(faustEN)
faustEN <- str_squish(faustEN)


faustGER <- readLines("data- swanwick/faust1-ger.txt")
faustGER <- paste(faustGER, sep = '', collapse = ' ')
faustGER <- sub('(.*)START OF THE PROJECT GUTENBERG EBOOK FAUST: DER TRAGÖDIE ERSTER TEIL ', '', faustGER)
faustGER <- sub('END OF THE PROJECT GUTENBERG EBOOK FAUST: DER TRAGÖDIE ERSTER TEIL(.*)', '', faustGER)
faustGER <- str_squish(faustGER)


iphigeniaEN <- readLines("data- swanwick/iphigenia-en.txt")
iphigeniaEN <- paste(iphigeniaEN, sep = '', collapse = ' ')
iphigeniaEN <- sub('(.*)START OF THE PROJECT GUTENBERG EBOOK IPHIGENIA IN TAURIS', '', iphigeniaEN)
iphigeniaEN <- sub('END OF THE PROJECT GUTENBERG EBOOK IPHIGENIA IN TAURIS(.*)', '', iphigeniaEN)
iphigeniaEN <- str_squish(iphigeniaEN)

iphigeniaGER <- readLines("data- swanwick/iphigenia-ger.txt")
iphigeniaGER <- paste(iphigeniaGER, sep = '', collapse = ' ')
iphigeniaGER <- sub('(.*)START OF THE PROJECT GUTENBERG EBOOK IPHIGENIE AUF TAURIS', '', iphigeniaGER)
iphigeniaGER <- sub('END OF THE PROJECT GUTENBERG EBOOK IPHIGENIE AUF TAURIS(.*)', '', iphigeniaGER)
iphigeniaGER <- str_squish(iphigeniaGER)

orleansEN <- readLines("data- swanwick/orleans-en.txt")
orleansEN <- paste(orleansEN, sep = '', collapse = ' ')
orleansEN <- sub('(.*)START OF THE PROJECT GUTENBERG EBOOK THE MAID OF ORLEANS: A TRAGEDY', '', orleansEN)
orleansEN <- sub('End of Project Gutenberg\'s The Maid of Orleans, by Frederich Schiller (.*)', '', orleansEN)
orleansEN <- str_squish(orleansEN)

orleansGER <- readLines("data- swanwick/orleans-ger.txt")
orleansGER <- paste(orleansGER, sep = '', collapse = ' ')
orleansGER <- sub('(.*)START OF THE PROJECT GUTENBERG EBOOK DIE JUNGFRAU VON ORLEANS', '', orleansGER)
orleansGER <- sub('Ende dieses Projekt Gutenberg Etextes "Die Jungfrau von Orleans" von Friedrich Schiller(.*)', '', orleansGER)
orleansGER <- str_squish(orleansGER)


write(faustEN, file = "corpus/sw_faust.txt")
write(faustGER, file = "corpus/g_faust.txt")
write(iphigeniaEN, file = "corpus/sw_iphigenia.txt")
write(iphigeniaGER, file = "corpus/g_iphigenia.txt")
write(orleansEN, file = "corpus/sw_orleans.txt")
write(orleansGER, file = "corpus/fs_orleans.txt")

# Create lists of function words
fWordsEN <- stopwords::stopwords("en", source = "stopwords-iso")
fWordsGER <- stopwords::stopwords("de", source = "stopwords-iso")

write(fWordsEN, file = "EN_functionWords.txt")
write(fWordsGER, file = "GER_functionWords.txt")
