#include <iostream>
#include <string>
#include <list>

using namespace std;

string PalindromeCheckerFunction(string Original_Text)
{
	list<char> Full_Char_List;
	int Length = Original_Text.length();
	cout << Length << endl;
	for (int i = 0; i < Length; i++)
	{
		char Character = Original_Text[i];
		cout << Character << endl;
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