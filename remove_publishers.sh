publishers=$1
for word in $(< $publishers); do
	echo $word | rename "s/^${word}\.//i" *.pdf *.mobi *.epub *.chm
	word=${word}.press
	echo $word | rename "s/^${word}\.//i" *.pdf *.mobi *.epub *.chm
done;

# remove titles with words that start with a number
rename "s/^\d\w*\.//i" *.pdf *.mobi *.epub *.chm

