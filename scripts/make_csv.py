import sys
import os

script = sys.argv[0]
infile = sys.argv[1]

output_data_path = os.path.split(infile)[0] + '/../csv/'
outfile_name = os.path.splitext(os.path.basename(infile))[0]+".csv"

outfile = output_data_path + outfile_name

input_file = open(infile,'r')
output_file = open(outfile, 'w')

for num,line in enumerate(input_file):
    output_file.write(line.strip().split(' ')[2] + '\r')

input_file.close()
output_file.close()
