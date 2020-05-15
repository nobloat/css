INCLUDED_FILES=$(shell cat style.css | sed -E ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' | sed -e "s/@import \"\(.*\.css\)\";/\1/g")

all: nobloat.min.css

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
	@du -b $(INCLUDED_FILES) | sort -n
	
	@echo ""
	@echo "---------- Packed -----------"
	@du -b nobloat.css nobloat.min.css

	@echo ""
	@echo "-------- Compressed --------"
	@du -b *.zst *.br

clean: 
	@rm -f nobloat.css
	@rm -f nobloat.min.css
	@rm -f *.br
	@rm -f *.zst
