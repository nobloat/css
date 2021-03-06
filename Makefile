INCLUDED_FILES=$(shell cat src/style.css | sed -E ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' | sed -e "s/@import \"\(.*\.css\)\";/src\/\1/g")

all: check nobloat.min.css

check:
	stylelint src/*.css
	html-validator --verbose --file index.html

nobloat.min.css: nobloat.css
	@cat $< \
	 | sed -e 's/\/\*.*\*\///g' \
	 | sed -e 's/0\./\./g' \
	 | sed -e 's/\([:\,=;><]\) /\1/g' \
	 | sed -e 's/ \([{\,=;<>]\)/\1/g' \
	 | tr -d '\t' | tr -d '\n' | tr -s ' ' ' '\
	 | sed -e 's/\([;{]\) /\1/g' \
	 | sed -e 's/;}/}/g' \
	 > $@

nobloat.css: $(INCLUDED_FILES)
	@cat $^ > $@


compress: nobloat.css nobloat.min.css
	@brotli $^ -f
	@zstd $^ -f

report: compress
	@echo ""
	@echo "--- Individual components ---"
	@wc -c $(INCLUDED_FILES) | sort -n
	
	@echo ""
	@echo "---------- Packed -----------"
	@wc -c nobloat.min.css

	@echo ""
	@echo "-------- Compressed --------"
	@wc -c *.zst *.br

clean: 
	@rm -f nobloat.css
	@rm -f nobloat.min.css
	@rm -f *.br
	@rm -f *.zst
	@rm -f index.html
