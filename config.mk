# Change this
PROJECT_NAME=template

WORK_DIR=work
XHTML_DIR=xhtml
XML_DIR=xml
PDF_DIR=pdf
RNG_DIR=$(XML_DIR)/rng
DBOOK_RNG_DIR=$(RNG_DIR)/dbook
XHTML_EXT=xhtml
IMG_EXT=png

XHTML_XSL_FILE=/usr/share/sgml/docbook/xsl-ns-stylesheets/xhtml-1_1/docbook.xsl
FO_XSL_FILE=/usr/share/sgml/docbook/xsl-ns-stylesheets/fo/docbook.xsl

FOP_PARAMS=-param paper.type A4 -param body.font.master 14

# change to index.xhtml if using multi-chunk xsl.
XHTML_FILE=$(XHTML_DIR)/$(PROJECT_NAME).$(XHTML_EXT)

PDF_FILE=$(PDF_DIR)/$(PROJECT_NAME).pdf
