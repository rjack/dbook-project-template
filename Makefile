include config.mk


.PHONY	: all xhtml pdf clean print_img web_img


all				: $(XHTML_FILE) $(PDF_FILE)
xhtml				: $(XHTML_FILE)
pdf				: $(PDF_FILE) 
web_img				: $(WEB_IMAGE_FILES)
print_img			: $(PRINT_IMAGE_FILES)


$(WORK_DIR)/%.valid		: $(XML_DIR)/%.xml
	$(VALIDATOR) $(VALIDATOR_OPTIONS) $< && touch $@


$(XHTML_DIR)/%.$(XHTML_EXT)	: $(XML_DIR)/%.xml $(WORK_DIR)/%.valid $(WEB_IMAGE_FILES)
	xsltproc $(XHTML_XSL_FILE) $< > $@


$(PDF_DIR)/%.pdf		: $(XML_DIR)/%.xml $(WORK_DIR)/%.valid $(PRINT_IMAGE_FILES)
	fop $(FOP_PARAMS) -xml $< -xsl $(FO_XSL_FILE) -pdf $@


$(IMG_WEB_DIR)/%.$(IMG_EXT)	: $(SVG_DIR)/%.svg
	$(SVG2IMG) $< $(SVG2IMG_WEB_OPTIONS) $@


$(IMG_PRINT_DIR)/%.$(IMG_EXT)	: $(SVG_DIR)/%.svg
	$(SVG2IMG) $< $(SVG2IMG_PRINT_OPTIONS) $@

clean				:
	rm -f $(PDF_FILE) $(XHTML_DIR)/*.$(XHTML_EXT) $(PRINT_IMAGE_FILES) $(WEB_IMAGE_FILES)
