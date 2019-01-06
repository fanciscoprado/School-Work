import java.util.Random;
import java.util.Scanner;

public class TreeTester
{
  public static void main(String[] args) throws Exception
  {
	Random rand = new Random(System.currentTimeMillis());
	int choice = 0;
	while (choice != 5)
	{
	System.out.println("1 = Test BST \n2 = Test AVL \n3 = Time BST & AVL Isertion\n5 = Quit");
	Scanner in = new Scanner(System.in);
	choice = in.nextInt();
	
	//BST Tree Test
	if(choice == 1)
	{
		BinarySearchTree<Integer> bst = new BinarySearchTree<>();
		
		while(bst.height() <5 )
		{
			bst.insert(rand.nextInt(100 - 10) + 10);
		}

		new TreePrinter(bst).print("bst");

		while(!bst.isEmpty())
		{
			bst.remove(bst.getRoot().getData());
			new TreePrinter(bst).print("Removed root");
		}
	}
//Francisco Praod
//Project 2
//csc130

	//AVL Tree test
	else if (choice == 2)
	{
		AvlTree<Integer> avl = new AvlTree<>();
		avl.printit(true);
	
		while(avl.counter < 35 )
		{
			avl.insert(rand.nextInt(100 - 10) + 10);
			new TreePrinter(avl).print("avl");
			avl.counter++;
		}
		System.out.println("------------------------------------------------------------------------------");
	
		while(!avl.isEmpty())
		{
			avl.remove(avl.getRoot().getData());
			if(!avl.isBalanced())
			{
				 throw new Exception("Tree is not balanced after insertion");
			}
        new TreePrinter(avl).print("Removed Root AVL Tree\n");
		}
	}
	
	//Time bst & avl
	else if (choice == 3)
	{
		int icounter = 0;
		System.out.println("How many random integers?\n");
		Scanner inn = new Scanner(System.in);
		int n = in.nextInt();
		BinarySearchTree<Integer> bst = new BinarySearchTree<>();
		AvlTree<Integer> avl = new AvlTree<>();
		int[] randomint = new int[n];
		//Unique Random intigers
		for(int spot=0; spot < n; spot++)
		{
			int temp = rand.nextInt((999999 - 1) + 1);
			for(int check=0; check < spot; check++)
			{
				if(randomint[check] == temp)
				{
					spot--;
					break;
				}
			}
			randomint[spot] = temp;
		}
		//bst time
		final long startTime = System.currentTimeMillis();
		while(icounter < n )
		{
			bst.insert(randomint[icounter]);
			icounter++;
		}
		final long endTime = System.currentTimeMillis();
		System.out.println("Total execution tiime BST: " + (endTime - startTime)+ "ms" );
		
		//AVL time
		icounter = 0;
		final long startTime2 = System.currentTimeMillis();
		avl.printit(false);
		while(icounter < n )
		{
			avl.insert(randomint[icounter]);
			icounter++;
		}
		final long endTime2 = System.currentTimeMillis();
		System.out.println("Total execution tiime avl: " + (endTime2 - startTime2)+ "ms" );
		
	}
		
	else
	{
		System.out.println("Invalid input");
	}
		
	
	
    
  }
  

return;


	}
}
