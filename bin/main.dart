// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
//  ]) ➞ true
bool sudokuValidator(List<List<int>>board){
  if(board.isEmpty){ //check for empty board
    return false;
  }
  if(!(board.length==9)) //check if 9 rows are present
      {return false;}
  for(int i=0;i<9;i++){
    if(!(board[i].length==9)) //check if 9 columns are present
        {return false;}
  }
  //check if every number in the board is in the range 1 to 9
  for(int i=0;i<9;i++){
    for(int j=0;j<9;j++){
      if(board[i][j]<1 || board[i][j]>9){
        return false;
      }
    }
  }

  //check for rows
  for(int i=0;i<9;i++){
    for(int j=1;j<10;j++){
      if(!board[i].contains(j)){
        print('row error');
        return false;
      }
    }
  }
  //check for columns
  List<int> tempList=[];
  for(int j=0;j<9;j++){
    for(int i=0;i<9;i++){
      tempList.add(board[i][j]);
    }//tempList created
    for(int index=1;index<10;index++){
      if(!tempList.contains(index)){
        print("column error");
        return false;
      }
    }//templist checked
  }
  //check for 3X3 boards
  //check for first 3X3
  if( boardCheck(0,0,board,1) &&
      boardCheck(0,3,board,2) &&
      boardCheck(0,6,board,3) &&
      boardCheck(3,0,board,4) &&
      boardCheck(3,3,board,5) &&
      boardCheck(3,6,board,6) &&
      boardCheck(6,0,board,7) &&
      boardCheck(6,3,board,8) &&
      boardCheck(6,6,board,9) )
  {return true;}
  else{return false;}
}

bool boardCheck(int row, int col,List<List<int>>board, int boardIndex){
  List<int> tempList=[];
  for(int i=row;i<row+3;i++){
    for(int j=col;j<col+3;j++){
      tempList.add(board[i][j]);
    }
  }
  for (int index = 1; index < 10; index++)  {
    if (!tempList.contains(index)) {
      print(" $boardIndex board error");
      return false;
    }
  }
  return true;
}
// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]
List<int> factorSort(List<int>inputList){
  //check for negative numbers
  for(int i=0;i<inputList.length;i++){
    if(inputList[i]<0){
      return [];
    }
  }
  for(int i=0;i<inputList.length-1;i++){
    for(int j=i+1;j<inputList.length;j++){
      if(factorLength(inputList[i])<factorLength(inputList[j])){
        //swap
        int temp=inputList[i];
        inputList[i]=inputList[j];
        inputList[j]=temp;
      }
      else if(factorLength(inputList[i])==factorLength(inputList[j]))
      {
        if(inputList[i]<inputList[j]){
          int temp=inputList[i];
          inputList[i]=inputList[j];
          inputList[j]=temp;
        }
      }
    }
  }
  return inputList;
}
int factorLength(int number){
  List<int> factorList=[];
  for(int i=1;i<=number;i++){
    if(number%i==0){
      factorList.add(i);
    }
  }
  // print("Printin factors of $number");
  // print(factorList);
  return factorList.length;
}


main() {
  print(sudokuValidator(
      [
        [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
        [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
        [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
        [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
        [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
        [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
        [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
        [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
        [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
      ]));
  print(factorSort([9, 7, 13, 12]));
}
