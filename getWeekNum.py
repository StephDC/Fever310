import csv
import sys

def calcNum(args):
    stdin = csv.reader(open(args[0],'r'))
    header = next(stdin)
    stdout = csv.writer(open(args[1],'w'))
    stdout.writerow(['weekID']+header)
    while True:
        try:
            data = next(stdin)
            cid = int(data[1])*52+int(data[2])%52
            stdout.writerow([cid]+data)
        except StopIteration:
            break

def countNum(args):
    stdin = csv.reader(open(args[0],'r'))
    header = next(stdin)
    stdout = csv.writer(open(args[1],'w'))
    stdout.writerow(['weekNum']+header)
    header = next(stdin)
    cid = int(header[1])*52+int(header[2])
    data = header
    while data[0] == header[0]:
        try:
            stdout.writerow([cid]+data)
            cid += 1
            data = next(stdin)
        except StopIteration:
            sys.exit(0)
    header = data
    cid = int(header[1])*52+int(header[2])
    while data[0] == header[0]:
        try:
            stdout.writerow([cid]+data)
            cid += 1
            data = next(stdin)
        except StopIteration:
            break

if __name__ == '__main__':
    countNum(sys.argv[1:])
