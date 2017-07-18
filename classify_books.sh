# cd where_books_are
# sh /Users/mertnuhoglu/Dropbox/projects/classify_books/classify_books.sh /Volumes/Seagate7/yayin/kitap/kitap5/
source=${PWD}
target=$1
script_root=/Users/mertnuhoglu/Dropbox/projects/classify_books
classifications=${script_root}/classification_rules.csv
cd $source
${script_root}/remove_publishers.sh 
while IFS=, read keyword path
do 
  echo "$keyword $path"
  cd $source
  mkdir -p $target/$path
  # log
  #find . -iname "*$keyword*" -print 
  #find . -iname "*$keyword*" -print0 | xargs -0 -I file mv $source/file $target/$path
  ls * | ag -i "$keyword"
  ls * | ag -i "$keyword" | tr '\012' '\000' | xargs -0 -I file mv $source/file $target/$path
done < $classifications

