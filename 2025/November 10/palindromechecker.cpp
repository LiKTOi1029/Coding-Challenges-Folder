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
	int Length = Original_Text.length();
	string Result;
	cout << Length << endl;
	for (int i = 0; i < Length; i++)
	{
		char Character = Original_Text[i];
		cout << 1;
		Full_Vector.push_back(Character);
		cout << 2;
		cout << Full_Vector[i] << endl;
	}
	for (int i = 0; i < ceil(Length/2); i++)
	{
		
	}
	return "";
}

int main()
{
	string Original_Text;
	getline (cin, Original_Text);
	string New_Text = PalindromeCheckerFunction(Original_Text);
}

// this is not finished lol. I am only just getting started.