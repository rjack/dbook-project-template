include config.mk


.PHONY	: all xhtml pdf clean


all				: $(XHTML_FILE) $(PDF_FILE)
xhtml				: $(XHTML_FILE)
pdf				: $(PDF_FILE)


$(WORK_DIR)/%.valid		: $(XML_DIR)/%.xml
	xmllint --noout --relaxng $(DBOOK_RNG_DIR)/docbook.rng $< && touch $@


$(XHTML_DIR)/%.$(XHTML_EXT)	: $(XML_DIR)/%.xml $(WORK_DIR)/%.valid
	xsltproc $(XHTML_XSL_FILE) $< > $@


$(PDF_DIR)/%.pdf		: $(XML_DIR)/%.xml $(WORK_DIR)/%.valid
	fop $(FOP_PARAMS) -xml $< -xsl $(FO_XSL_FILE) -pdf $@


clean				:
	rm -f $(PDF_DIR)/*.pdf $(XHTML_DIR)/*.$(XHTML_EXT)
