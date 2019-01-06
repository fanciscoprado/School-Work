
//Francisco Prado
//Project 1
import java.util.EmptyStackException;

public class ListStack implements DStack
{
	private ListStackNode top;


	public ListStack() //constructs the stack top set to null
	{
		this.top = null;
	}


	public boolean isEmpty() //returns weather the stack is empty
	{
		return this.top == null;
	}

	// Push value into top of stack
	public void push(double d)
	 {
		if(top == null) //if list is empty pushes first value
		{
			top = new ListStackNode(d, null);
		}
		else // puts new value on top
		{
			top = new ListStackNode(d, top);
		}
	}
// removes and returns the value at top of the satack
// throws erro if the stack is empty
	public double pop()
	{
		if(this.isEmpty())
		{
			throw new EmptyStackException();
		}
		double topvalue = top.data;
		this.top = this.top.previous;
		return topvalue;
	}
//throws error if the stack is Empty
//returns value on top of stack
	public double peek()
	{
		if(isEmpty())
		{
			throw new EmptyStackException();
		}
		return this.top.data;
	}

}
