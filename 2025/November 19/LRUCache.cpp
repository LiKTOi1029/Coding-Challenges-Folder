#include <iostream>
#include <vector>
#include <string>
#include <locale>

void Iterator(std::vector<int> Vector)
{
	for (auto item = Vector.begin(); item != Vector.end(); ++item)
	{
		std::cout << *item << " ";
	}
}
int main()
{
	std::vector<int> LRUCache;
	int Limit;
	int UserInput;
	std::string Choice;
	std::cout << "Set a limit for the cache (integral, don't do a long ass number please): " << std::endl;
	std::cin >> Limit;
	std::cout << std::endl;
	while (Choice != "EXIT")
	{
		int Size = LRUCache.size();
		std::cout << "Input an integer to add to the Cache, current cache items: \n";
		Iterator(LRUCache);
		std::cout << std::endl;
		std::cout << "A) Add a number\nU) Use a number\nEXIT) Exit the script\n";
		std::cin >> Choice;
		if (Choice == "A") 
		{
			if (Limit == Size) 
			{
				LRUCache.pop_back();
				std::cout << "Enter an integer: ";
				std::cin >> UserInput;
				LRUCache.insert(LRUCache.begin(), UserInput);
			}
			else
			{
				std::cout << "Enter an integer: ";
				std::cin >> UserInput;
				LRUCache.insert(LRUCache.begin(), UserInput);
			}
		}
		else if (Choice == "U")
		{
			if (!LRUCache.empty())
			{
				Iterator(LRUCache);
				std::cout << std::endl << "Which number would you like to alter? The index is from 0 to "
						  << Size-1 << ": " << std::endl;
				std::cin >> UserInput;
				int Temporary = LRUCache[UserInput];
				LRUCache.erase(LRUCache.begin() + UserInput);
				LRUCache.insert(LRUCache.begin(), Temporary);
			}
			else 
			{
				std::cout << "There are currently no values in the cache! Add some new numbers to it!" << std::endl;
			}
		}
	}
}