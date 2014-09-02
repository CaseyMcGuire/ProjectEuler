class LongestCollatzSequence{

    static long[] chainLengths = new long[80000000];

    public static void main(String[] args){
	System.out.println(findLongestCollatzSequence(1000000));
	System.out.println(findLengthOfSingleSequence(13));
    }

    public static long findLongestCollatzSequence(int n){
	long max = 1;
	chainLengths[1] = 1;

	for(int i = 2; i<n; i++){
	    long cur;
	    if((cur = findLengthOfSingleSequence(i)) > max) max = cur;
	    
	}
	return max;
    }

    /*
      
     */
    public static long findLengthOfSingleSequence(long i){
	//	if(i < 80000000 && chainLengths[(int)i] != 0) return chainLengths[(int)i];
	long length = 1;
	while(i != 1){
	    
	    length++;
	    if(i < 80000000 && chainLengths[(int)i] != 0) {		
		length =  length + chainLengths[(int)i];
		break;
	    }
	    if(i%2 == 0){
		i = i/2;
	    }
	    else{
		//	System.out.println("b" + i);
		i = 3*i + 1;
		//	System.out.println(i);
	    }
	}
	chainLengths[(int)i] = length;
	return length;
    }
}
