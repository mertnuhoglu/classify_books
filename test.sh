for word in $(< publishers.txt); do
	echo $word | rename -n "s/^${word}\.//i" *.pdf 
done;

