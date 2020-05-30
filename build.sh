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
		echo "<details><summary class=\"color-default\">View HTML</summary><div>" >> index.html
		echo "<pre><code class=\"html\">$(cat "src/${BASH_REMATCH[1]}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</code></pre>" >> index.html
		echo "</div></details>" >> index.html

		echo "<details><summary class=\"color-default\">View CSS</summary><div>" >> index.html
		echo "<pre><code class=\"css\">$(cat "src/$name.css" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g')</code></pre>" >> index.html
		echo "</div></details>" >> index.html
		continue
	fi

	echo $line >> index.html
done