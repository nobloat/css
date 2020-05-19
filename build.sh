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
		echo "<div class=\"row space-around\">" >> index.html
		echo "<div class="acc"><div><input type=\"checkbox\" id=\"html-$name\" hidden><label class=\"color-default\" for=\"html-$name\">View HTML</label><div>" >> index.html
		echo "<pre><code class=\"html\">$(cat "src/${BASH_REMATCH[1]}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</code></pre>" >> index.html
		echo "</div></div></div>" >> index.html

		echo "<div class="acc"><div><input type=\"checkbox\" id=\"css-$name\" hidden><label class=\"color-default\" for=\"css-$name\">View CSS</label><div>" >> index.html
		echo "<pre><code class=\"css\">$(cat "src/$name.css" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</code></pre>" >> index.html
		echo "</div></div></div></div>" >> index.html
		continue
	fi

	echo $line >> index.html
done