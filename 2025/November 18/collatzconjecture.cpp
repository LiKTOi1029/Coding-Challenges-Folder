#include <iostream>

int main()
{
	int Number;
	int Result = 0;
	std::cin >> Number;
	while (Number > 1) 
	{
		if (Number % 2 == 1)
		{
			Number = (Number*3)+1;
		}
		else 
		{
			Number = Number/2;
		}
		Result+=1;
	}
	std::cout << "It took " << Result << " iterations to reach 1!" << std::endl;
	return Result;
}