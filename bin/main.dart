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
bool checkRowForRepetitions(List<List<int>> board, int row) {
  return board[row].toSet().length==9;
 }


bool checkForColumnRepetitions(List<List<int>> board, int col) {
List<int> tempList = [];
  for (int i = 0; i < 9; i++) {
    tempList.add(board[i][col]);
  }
   return tempList.toSet().length==9;
}

bool checkForBoxRepetitions(List<List<int>> board, int row, int col) {
// Set to store characters seen so far.
  List<int> st = [];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int curr = board[i + row][j + col];
      if (st.contains(curr)) {
        return false;
      } else {
        st.add(curr);
      }
    }
  }
  return true;
}

bool isValid(List<List<int>> board, int row, int col) {
  bool flag=true;
  if(row%3==0 && col%3==0){ // reduces the number of times check for box is performed. Now its performed only 9 times
    flag=checkForBoxRepetitions(board,row,col);
  }
  return checkRowForRepetitions(board, row) &&
      checkForColumnRepetitions(board, col) && flag;


}

bool sudokuValidator(List<List<int>> board) {
  int n = 9;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if(board[i][j]<1 || board[i][j]>9){ //check for correct range
        return false;
      }
      if (!isValid(board, i, j)) {
        return false;
      }
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

// Sort an array of numbers according
// to number of factors.

List factorSort(List<int> numbers) {
  numbers.sort(comparator);
  return numbers;
}

int comparator(int a, int b) {
  int aFactorCount = 0;
  int bFactorCount = 0;
  for (int i = 1; i < a; i++) {
    if (a % i == 0) {
      aFactorCount++;
    }
  }
  for (int i = 1; i < b; i++) {
    if (b % i == 0) {
      bFactorCount++;
    }
  }
  if (aFactorCount < bFactorCount) return 1;
  if (aFactorCount > bFactorCount) return -1;
  if (aFactorCount == bFactorCount) {
    if (a < b) return 1;
    if (a == b) return 0;
    if (a > b) return -1;
  }
}


main() {

  print (sudokuValidator([
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