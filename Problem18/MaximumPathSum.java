import java.util.*;
import java.io.*;

class MaximumPathSum{

    public static void main(String[] args){
	Scanner scanner = null;
	try{
	    scanner = new Scanner(new File(args[0]));
	    List<List<Integer>> triangle = new ArrayList<List<Integer>>();
	    
	    int index = 0;
	    while(scanner.hasNextLine()){
		triangle.add(new ArrayList<Integer>());
		for(String s: scanner.nextLine().split(" ")){
		    System.out.print(s + " ");
		    triangle.get(index).add(Integer.parseInt(s));
		}
		System.out.println();
		index++;
	    }

	    System.out.println(findMaximumPathSum(convertToMultiDimensionIntArray(triangle)));
	}
	catch(FileNotFoundException e){
	    System.err.println("Sorry, the file was not found");
	}
	finally{
	    if(scanner != null) scanner.close();
	}
    }

    public static int[][] convertToMultiDimensionIntArray(List<List<Integer>> listOfLists){
	int[][] array = new int[listOfLists.size()][];

	for(int i = 0; i<array.length; i++){
	    array[i] = new int[listOfLists.get(i).size()];
	    for(int j = 0; j<array[i].length; j++){
		array[i][j] = listOfLists.get(i).get(j);
		System.out.print(array[i][j] + " ");
	    }
	    System.out.println();
	}
	
	return array;
    }

    

    public static int findMaximumPathSum(int[][] triangle){
	for(int i = triangle.length - 2; i>=0 ; i--){
	    for(int j = triangle[i].length - 1; j>=0;j--){
		int right = triangle[i][j] + triangle[i+1][j+1];
		int left = triangle[i][j] + triangle[i+1][j];
		triangle[i][j] = Math.max(left, right);
	    }
	}
	return triangle[0][0];
    }


}
