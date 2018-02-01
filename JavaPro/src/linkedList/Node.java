package linkedList;

public class Node {
	
	int dataValue;
	Node pointer;
	
	
	public Node() {
		pointer=null;
		dataValue=0;
	}


	public Node(int dataValue, Node pointer) {
		super();
		this.dataValue = dataValue;
		this.pointer = pointer;
	}


	public int getDataValue() {
		return dataValue;
	}


	public void setDataValue(int dataValue) {
		this.dataValue = dataValue;
	}


	public Node getPointer() {
		return pointer;
	}


	public void setPointer(Node pointer) {
		this.pointer = pointer;
	}
	
	
	

}
