#include <iostream>
using namespace std;

void resizeArray(int** array, int &size) 
{
	int* newArray = new int[size+10];
	for(int i=0; i<size; i++)
	{
		newArray[i] = (*array)[i];
	}	
	size=size*2;
	delete [] (*array);
	*array = newArray;
}

int main()
{
	int *arr;
	int max = 10;
	arr = new int[max];
	int numElems = 0;
	int i = 0;
	for(; i != -1; )
	{
		cin >> i;
		if(i != -1 && cont<max)
		{
			arr[numElems] = i;
			numElems++;
		}
		if(numElems == max)
		{
			resizeArray(&arr,max); 
		}	
	}
	for(int i=0; i<numElems; i++)
		cout << arr[i] << " ";
	cout << endl;
	cout << max << endl;
	cout << numElems;
	delete [] arr;
}
