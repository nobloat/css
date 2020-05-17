#!/bin/bash
echo "" > index.html
cat src/index.html | while read line
do
	[[ "$line" =~ include:(.*\.html) ]]
	if [ "${BASH_REMATCH[1]}" != "" ]
	then
		cat "src/${BASH_REMATCH[1]}" >> index.html
		continue
	fi

	[[ "$line" =~ code:(.*\.html) ]]
	if [ "${BASH_REMATCH[1]}" != "" ]
	then
		echo "" >> index.html
		name="${BASH_REMATCH[1]%%.*}"
		echo "<div class="acc"><div><input type=\"checkbox\" id=\"code-$name\" hidden><label class=\"color-default\" for=\"code-$name\">View source</label><div>" >> index.html
		echo "<pre class=\"code\" data-lang=\"HTML\">$(cat "src/${BASH_REMATCH[1]}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</pre>" >> index.html
		echo "</div></div></div>" >> index.html
		continue
	fi

	echo $line >> index.html
done