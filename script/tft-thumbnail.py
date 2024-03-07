#!/usr/bin/python
import sys
import base64
import regex
from os.path import exists
from io import BytesIO
from PIL import Image

def rgb2tft(r, g, b):
    r = r >> 3
    g = g >> 2
    b = b >> 3
    rgb = (r << 11) | (g << 5) | b
    return '{:02x}'.format(rgb & 0xFF) + '{:02x}'.format(((rgb >> 8) & 0xFF))

def generate_tft(img):
    width, height = img.size
    if(width == 100):
        res = '\n;simage:'
    else:
        res = '\n;;gimage:'
    pixels = img.convert('RGB')
    for y in range(width):
        for x in range(height):
            r, g, b = pixels.getpixel((x,y))
            res += rgb2tft(r, g, b)
        res += '\nM10086 ;'
    return res

def convertPrusaThumb2TFTThumb(inputfile, outputfile):
    if not exists(inputfile):
        return

    gcode_in = open(inputfile).read()

    s_pattern = '(?<=(; thumbnail begin )([0-9]+)(x)([0-9]+) ([0-9]+)\n)(.*?)(?=; thumbnail end)'
    pattern = regex.compile(s_pattern, regex.M|regex.I|regex.S )
    gcode_out = '; Postprocessed by tft-thumbnail plugin'

    for match in pattern.finditer(gcode_in): 
        th_width  = match.group(2)
        th_height = match.group(4)
        th_size   = match.group(5)

        try:
            th_datas  = match.group(6)
            th_datas = th_datas.replace('; ', '').replace('\n', '')
            stream = BytesIO( base64.b64decode(th_datas) )
            image = Image.open(stream).convert("RGB")
            stream.close()
            gcode_out += generate_tft(image)
        except:
            pass

    try:
        s_pattern = '; thumbnail begin .*; thumbnail end'
        gcode_out = gcode_out + '\n' +  regex.sub( s_pattern, '', gcode_in, flags = regex.M|regex.I|regex.S )
        fileOut = open(outputfile, "w")
        fileOut.write(gcode_out)
        fileOut.close()
    except:
        pass

    return

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        inputfile = argv[1]
        try:
            outputfile = argv[2]
        except:
            outputfile = argv[1]
    except:
        print('./tft-thumbnail infile [outfile]')
        sys.exit()
    convertPrusaThumb2TFTThumb(inputfile, outputfile)

if __name__ == "__main__":
   main(sys.argv)
