#! /usr/bin/env python3

import sys
import csv
import datetime

def getDeltaDay(date,start = '1990-01-01'):
    if (date.find('-')!=-1):
        tmp = start.split('-')
        s = datetime.date(int(tmp[0]),int(tmp[1]),int(tmp[2]))
        tmp = date.split('-')
        e = datetime.date(int(tmp[0]),int(tmp[1]),int(tmp[2]))
        return int((e-s).days / 7)
    else:
        return 'weekNum'

def main(args):
    stdin = (csv.reader(open(args[0],'r')),csv.reader(open(args[1],'r')))
    if len(args) > 2:
        stdout = csv.writer(open(args[2],'w'))
    else:
        stdout = csv.writer(sys.stdout)
    while True:
        try:
            tmp = (next(stdin[0]),next(stdin[1]))
            if tmp[0][0] != tmp[1][0] or tmp[0][1] != tmp[1][1] or tmp[0][2] != tmp[1][2]:
                raise SyntaxError('Header mismatch!')
            idcol = getDeltaDay(tmp[0][3])
            stdout.writerow([idcol]+tmp[0]+tmp[1][3:])
        except StopIteration:
            break

if __name__ == '__main__':
    main(sys.argv[1:])
