
//Francisco Prado
//Project 1
public class ListStackNode
{
	public double data;			//a node storing a double value data
	public ListStackNode previous; //points to previous node in the stack

	//constructs a node with given data and null pointer
	public ListStackNode(double data)
	{
		this(data, null);
	}


	//constructs a node with given data and given pointer
	public ListStackNode(double value, ListStackNode previous)
	 {
		this.data = value;
		this.previous = previous;
	}
}
