BOOK_FILE_NAME = "SleepIsForTheWeak"
SRC_DIR = Chapters

ARGS = $(shell ls -1 $(SRC_DIR) | sed -e "s/^/$(SRC_DIR)\//")

EPUB_BUILDER = pandoc
EPUB_BUILDER_FLAGS = \
					 --epub-metadata=metadata.xml \
					 -sS

MOBI_BUILDER = kindlegen


epub: title.txt $(ARGS)
	$(EPUB_BUILDER) $(EPUB_BUILDER_FLAGS)  --chapters -o $(BOOK_FILE_NAME).epub title.txt $(ARGS)


mobi: $(ARGS) $(SOURCE_FILE_NAME)
		$(MOBI_BUILDER) $^

clean:
		rm -f $(BOOK_FILE_NAME).epub
		rm -f $(BOOK_FILE_NAME).mobi
