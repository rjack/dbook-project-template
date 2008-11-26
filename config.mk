# Change this
PROJECT_NAME=template

WORK_DIR=work
XHTML_DIR=xhtml
XML_DIR=xml
PDF_DIR=pdf
RNG_DIR=$(XML_DIR)/rng
XSD_DIR=$(XML_DIR)/xsd
XHTML_EXT=xhtml


DBOOK_RNG_DIR=$(RNG_DIR)/dbook
DBOOK_XSD_DIR=$(XSD_DIR)/dbook
VALIDATOR=xmllint
VALIDATOR_OPTIONS=--noout --schema $(DBOOK_XSD_DIR)/docbook.xsd

IMG_EXT=png
IMG_DIR=img
SVG_DIR=$(IMG_DIR)/svg
IMG_WEB_DIR=$(XHTML_DIR)/$(IMG_DIR)
IMG_PRINT_DIR=$(IMG_DIR)/print

XHTML_XSL_FILE=/usr/share/sgml/docbook/xsl-ns-stylesheets/xhtml-1_1/docbook.xsl
FO_XSL_FILE=/usr/share/sgml/docbook/xsl-ns-stylesheets/fo/docbook.xsl

SVG2IMG=inkscape --export-area-drawing
IMG_WEB_DPI=90
IMG_PRINT_DPI=600
SVG2IMG_WEB_OPTIONS=-d $(IMG_WEB_DPI) -e
SVG2IMG_PRINT_OPTIONS=-d $(IMG_PRINT_DPI) -e

FOP_PARAMS=-param paper.type A4 -param body.font.master 14


# change this: space-separated list of the filenames in SVG_DIR, without extension
IMAGES=copyleft
WEB_IMAGE_FILES=$(addprefix $(IMG_WEB_DIR)/, $(IMAGES).$(IMG_EXT))
PRINT_IMAGE_FILES=$(addprefix $(IMG_PRINT_DIR)/, $(IMAGES).$(IMG_EXT))

# change to index.xhtml if using multi-chunk xsl.
XHTML_FILE=$(XHTML_DIR)/$(PROJECT_NAME).$(XHTML_EXT)
PDF_FILE=$(PDF_DIR)/$(PROJECT_NAME).pdf
