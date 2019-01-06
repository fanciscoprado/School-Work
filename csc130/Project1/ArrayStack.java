//Francisco Prado
//Project 1
import java.util.EmptyStackException;

public class ArrayStack implements DStack
{
  private double[] values;
  private int size;

//creats array
  public ArrayStack()
  {
    this.values = new double[10];
    this.size = 0;

  }
//checks if stack is empty
  public boolean isEmpty()
  {
    return this.size == 0;
  }

//pushes the values in to the array
  public void push(double d)
  {
    if(this.size == this.values.length)//if array is full doubles size
    {
      double[] temparray = new double[this.size * 2];
      int counter = 0;
      while (counter != this.size)
      {
        temparray[counter] = this.values[counter];
        counter++;
      }
      this.values = temparray;
    }
    this.values[this.size] = d;//pushes value into array
    this.size++; //array size counter +1
  }
//pops value from top of array
//returns poped value
  public double pop()
  {
    if (this.isEmpty())
    {
      throw new EmptyStackException();
    }
    double temp = this.values[this.size];
    this.size--;
    return temp;

  }

  //Returns value at top of array
  public double peek()
  {
    if (this.isEmpty())
    {
      throw new EmptyStackException();
    }
    return this.values[this.size];

  }




}
