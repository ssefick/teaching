#!/usr/bin/env python

import sys
import os
import os.path
from pyPdf import PdfFileWriter, PdfFileReader

infile=sys.argv[1]

directory=sys.argv[2]

outfile=os.path.join(directory, "document-page%s.pdf")

if not os.path.exists(directory):
        os.makedirs(directory)

inputpdf = PdfFileReader(open(infile, "rb"))

for i in xrange(inputpdf.numPages):
        output = PdfFileWriter()
        output.addPage(inputpdf.getPage(i))
        with open(outfile % i, "wb") as outputStream:
            output.write(outputStream)
