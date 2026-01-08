# カレントディレクトリの全ての.texファイルを取得
TEXSRC := $(wildcard *.tex)

# 各.texに対応する.pdfファイルをTARGETSとして定義
TARGETS := $(TEXSRC:.tex=.pdf)

.PHONY: all clean distclean

# all で全ての.pdfをビルド
all: $(TARGETS)

# 中間ファイルの削除
clean:
	$(RM) *.aux *.log *.dvi *.bbl *.blg

# PDFも含めて完全削除
distclean: clean
	$(RM) $(TARGETS)

# .dvi → .pdf
%.pdf: %.dvi
	dvipdfmx $<

# .tex → .dvi （参照や目次を考慮して2回コンパイル）
%.dvi: %.tex $(wildcard input/*.tex) 
	# メインファイルを置換
	sed -i '' 's/。/./g' $<
	sed -i '' 's/、/, /g' $<
	# input内の全texファイルを置換
	@for f in $(wildcard input/*.tex); do \
		sed -i '' 's/。/./g' $$f; \
		sed -i '' 's/、/, /g' $$f; \
	done
	uplatex $<
	uplatex $<
