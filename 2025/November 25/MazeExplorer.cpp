#include <fstream>
#include <map>
#include <iostream>
#include <string>
#include <sstream>

typedef std::string string;

int Solve()
{
	
	std::map<char,int> MazeSheet;
	MazeSheet['-'] = 1;
	MazeSheet['|'] = 1;
	MazeSheet[' '] = 0;
	MazeSheet['X'] = -2;
	MazeSheet['O'] = 2;
	
	std::ifstream InputFile("Maze.maze");
	string FileContents;
	std::stringstream Buffer;
	Buffer << InputFile.rdbuf();
	FileContents = Buffer.str();
	
	InputFile.close();
	
	for (char Tile : FileContents)
	{
		if (MazeSheet[Tile] == 2)
		{
			std::cout << "I found " << Tile << " and now I'm exiting!\n";
			break;
		}
	}
	
	return 0;
}

int main()
{
	int Input;
	std::cout << "Main Menu\n";
	std::cout << "1) Solve Maze File\n";
	std::cout << "2) Exit\n";
	do
	{
		std::cin >> Input;
		
		switch(Input)
		{
			case 1:
				Solve();
				break;
			case 2:
				std::cout << "[INFO]: Exiting!";
				break;
			default:
				std::cout << "[INFO]: Invalid option!";
		}
		
	}
	while(Input != 2);
}