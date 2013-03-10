SOURCE_FILE_NAME = README.md
BOOK_FILE_NAME = "ExitingPovertyThroughEducation"
SRC_DIR = Chapters

ARGS = $(shell ls -1 $(SRC_DIR) | sed -e "s/^/$(SRC_DIR)\//")

PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
						--latex-engine xelatex \
							--template ../common/pdf-template.tex \
								--listings

EPUB_BUILDER = pandoc
EPUB_BUILDER_FLAGS = \
					 --epub-metadata=metadata.xml \
					 -sS

MOBI_BUILDER = kindlegen

pdf:
		$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o "$(BOOK_FILE_NAME).pdf"

epub: title.txt 
	$(EPUB_BUILDER) $(EPUB_BUILDER_FLAGS)  --chapters -o $(BOOK_FILE_NAME).epub title.txt $(ARGS)


mobi: mongodb.epub
		$(MOBI_BUILDER) $^

clean:
		rm -f $(BOOK_FILE_NAME).pdf
		rm -f $(BOOK_FILE_NAME).epub
		rm -f $(BOOK_FILE_NAME).mobi
