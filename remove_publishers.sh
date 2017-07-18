# cd where_books_are
# sh /Users/mertnuhoglu/Dropbox/projects/classify_books/remove_publishers.sh 
script_root=/Users/mertnuhoglu/Dropbox/projects/classify_books
publishers=$script_root/publishers.txt
for word in $(< $publishers); do
	echo $word | rename -n "s/${word}(\.\w*)$/\1/i" *.pdf *.mobi *.epub *.chm *.azw3 *.djvu
	echo $word | rename "s/^${word}\.//i" *.pdf *.mobi *.epub *.chm *.azw3 *.djvu
	word=${word}.press
	echo $word | rename "s/^${word}\.//i" *.pdf *.mobi *.epub *.chm *.azw3 *.djvu
done;

# remove titles with words that start with a number
rename "s/^\d\w*\.//i" *.pdf *.mobi *.epub *.chm

