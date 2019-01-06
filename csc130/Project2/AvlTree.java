//Francisco Praod
//Project 2
//csc130

//public class AvlTree extends BinarySearchTree
public class AvlTree<AnyType extends Comparable<AnyType>> extends BinarySearchTree<AnyType>
{
	@Override
	protected BinaryNode<AnyType> insert(AnyType data,BinaryNode<AnyType> node) // overrides insert
	{
		return balance(super.insert(data, node));
	}
	@Override
	protected BinaryNode<AnyType> remove(AnyType data, BinaryNode<AnyType> node) // overrides remove
	{
		return balance(super.remove(data, node));
	}
	
private BinaryNode<AnyType> balance(BinaryNode<AnyType> root)// bnalances tree
    {
        if(root == null)
        {
            return null;
        }

        if(height(root.getLeft()) - height(root.getRight()) > 1)
        {
            if(height(root.getLeft().getLeft()) >= height(root.getLeft().getRight()))
            {
                root = singleRightRotation(root);
            }
            else
            {
                root = doubleLeftRightRotation(root);
            }
        }
        else if(height(root.getRight()) - height(root.getLeft()) > 1)
        {
            if(height(root.getRight().getRight()) >= height(root.getRight().getLeft()))
            {
                root = singleLeftRotation(root);
            }
            else
            {
                root = doubleRightLeftRotation(root);
            }
        }

        return root;
    }
	//next 4 methods are the different rotaions
	private BinaryNode<AnyType> singleRightRotation(BinaryNode<AnyType> k2)
	{
		if(printits)
		{
			System.out.print("\n singleRightRotation on ");
			System.out.println(k2.getData());
		}
		BinaryNode<AnyType> k1 = k2.getLeft();
		k2.setLeft(k1.getRight());
		k1.setRight(k2);
		k2.setHeight(Math.max(height(k2.getLeft()),  height(k2.getRight())) + 1);
		k1.setHeight(Math.max(height(k1.getLeft()),  k2.getHeight()) +1);
		
		return k1;
	}
	
	private  BinaryNode<AnyType> singleLeftRotation(BinaryNode<AnyType> k1)
	{
		if(printits)
		{
			System.out.print("\n singleLeftRotation on ");
			System.out.println(k1.getData());
		}
		BinaryNode<AnyType>  k2 = k1.getRight();   
		k1.setRight(k2.getLeft());  
		k2.setLeft(k1);
		k1.setHeight(Math.max(height(k1.getLeft()), height(k1.getRight())) + 1);
		k2.setHeight(Math.max(height(k2.getRight()),  k1.getHeight()) +1);
		return k2;
	}
	
	private BinaryNode<AnyType> doubleLeftRightRotation(BinaryNode<AnyType> k3)
	{
		if(printits)
		{
			System.out.print("\n doubleLeftRightRotation on ");
			System.out.println(k3.getData());
		}
		k3.setLeft(singleLeftRotation(k3.getLeft()));
		return singleRightRotation(k3);
	}
	
	private BinaryNode<AnyType> doubleRightLeftRotation(BinaryNode<AnyType> k1)
	{
		if(printits)
		{
			System.out.print("\n doubleRightLeftRotation on ");
			System.out.println(k1.getData());
		}
		k1.setRight(singleRightRotation(k1.getRight()));
		return singleLeftRotation(k1);
	}
	
	
	//checks is tree is balanced
	public boolean isBalanced()
	{
		return isBalanced(root);
	}
	
	private boolean isBalanced(BinaryNode<AnyType> root)
	{
		if(root == null)
        {
            return true;
        }
        else
        {
            int leftHeight = height(root.getLeft());
            int rightHeight = height(root.getRight());
            return Math.abs(leftHeight - rightHeight) <= 1;
        }
	}
	//used to check if rotations should be printed
	private boolean printits;
	public boolean printit(boolean x)
	{
		printits = x;
		return x;
	}
}