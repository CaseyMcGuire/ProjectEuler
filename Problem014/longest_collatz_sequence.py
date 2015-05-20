import time

chain_lengths = {1:1}

def length_of_sequence(num):
    '''
    Using the rules of Collatz sequence, returns the number of iterations
    before 1 is reached.
    '''
    #if num has been calculated before, just return it
    if num in chain_lengths:
        return chain_lengths[num]
        
    length = 1
    
    orig_num = num

    while num != 1:
               
        if num%2 == 0:
            num = num/2
        else:
            num = 3*num + 1
            
        if num in chain_lengths:
            length = length + chain_lengths[num] 
            break
        length += 1        
        
    chain_lengths[orig_num] = length
    return length


def find_max(low, high):
    '''
    Returns the number at which the longest Collatz sequence occurs 
    between the parameters low and high.
    '''
    max = 1
    num = 0
    for i in range(low, high):
        cur = length_of_sequence(i)
        
        if cur > max:
            max = cur
            num = i
    return num


if __name__=='__main__':
    start = time.clock()
    print find_max(2,999999)
    print  time.clock() - start
