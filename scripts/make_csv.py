import sys

script = sys.argv[0]
infile = sys.argv[1]

outfile = infile[0:-4]+".csv"

input_file = open(infile,'r')
output_file = open(outfile, 'w')

for num,line in enumerate(input_file):
    output_file.write(line.strip().split(' ')[2] + '\r')
    
input_file.close()
output_file.close()