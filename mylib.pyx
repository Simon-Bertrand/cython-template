
from libc.stdlib cimport rand
import numpy as np
cimport numpy as np

cpdef dict simulate(int nSamples = 16384):
    cdef char[100] string
    cdef int bobWins =0, aliceWins = 0;
    cdef int alicePts = 0,bobPts = 0
    cdef int randomNum = 0
    for i in range(nSamples):
        for j in range(0,100,2):
            randomNum = rand()%4
            if randomNum==0:
                    string[j] = 'H'
                    string[j+1] = 'H'
            elif randomNum==1:
                    string[j] = 'H'
                    string[j+1] = 'T'
            elif randomNum==2:
                    string[j] = 'T'
                    string[j+1] = 'H'
            elif randomNum==3:
                    string[j] = 'T'
                    string[j+1] = 'T'
        for j in range(99):
            if string[j:j+2]==b'HT':
                bobPts+=1
            elif string[j:j+2]==b'HH':
                alicePts+=1

        if alicePts<bobPts:
            bobWins+=1
        if alicePts>bobPts:
            aliceWins+=1
        alicePts, bobPts = 0,0
    
    return dict(bobWins=bobWins, aliceWins=aliceWins,n=nSamples)
