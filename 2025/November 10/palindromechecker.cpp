#include <iostream>
#include <string>
#include <vector>
#include <cmath>

using namespace std;

vector<char> Swapper(vector<char> Vector, int Index_One, int Index_Two)
{
	char Temporary;
	Temporary = Vector[Index_One];
	Vector[Index_One] = Vector[Index_Two];
	Vector[Index_Two] = Temporary;
	return Vector;
}

string PalindromeCheckerFunction(string Original_Text)
{
	vector<char> Full_Vector(0);
	vector<char> Full_Vector_New(0);
	int Size;
	int Length = Original_Text.length();
	string Result;
	cout << Length << endl;
	for (int i = 0; i < Length; i++)
	{
		char Character = Original_Text[i];
		Full_Vector.push_back(Character);
	}
	Size = Full_Vector.size()-1;
	cout << Size << endl;
	for (int i = 0; i < ceil(Length/2); i++)
	{
		Size = (Size-i);
		Full_Vector_New = Swapper(Full_Vector, i, Size);
		cout << Full_Vector[i] << " " << Full_Vector[Size] << endl;
	}
	string New_Text(Full_Vector_New.begin(), Full_Vector_New.end());
	if (New_Text == Original_Text)
	{
		return New_Text + " and " + Original_Text + " Are palindromes!";
	}
	return New_Text + " and " + Original_Text + " Are not palindromes!";
}

int main()
{
	string Original_Text;
	getline (cin, Original_Text);
	string New_Text = PalindromeCheckerFunction(Original_Text);
	cout << New_Text << endl;
}

// this is not finished lol. I am only just getting started.