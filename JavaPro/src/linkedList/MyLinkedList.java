package linkedList;

public class MyLinkedList {
	
	static Node start;
	static Node end;
	static int size;
	
	public static boolean isEmpty() {
		if(start==null) {
			return true;
		}
		return false;
	}
	
	public static void insertAtStart(int newData) {
		Node newNode= new Node(newData,null);
		size++;
		if(start==null) {
			start=newNode;
			end=start;
		}
		else {
			newNode.setPointer(start);
			start=newNode;
		}
	}
	
	public static void insertAtEnd(int newData) {
		Node newNode= new Node(newData,null);
		size++;
		if(start==null) {
			start=newNode;
			end=start;
		}
		else {
			end.setPointer(newNode);
			end=newNode;
		}
	}
	
	public void printMyList() {
		//list is empty
		if(size==0) {
			System.out.println("List is empty");
			return;
		}
		
		//list contains one node
		if(start.getPointer()==null) {
			System.out.println(start.getDataValue());
			return;
		}
		
		//list contains more than one node
		Node n=start;
		System.out.println(start.getDataValue());
		n=start.getPointer();
		while(n.getPointer()!=null) {
			System.out.println(n.getDataValue());
			n=n.getPointer();
		}
		System.out.println(n.getDataValue());
	}
	
	public void insertAt(int val, int index) {
		Node node=new  Node(val,null);
		Node n=start;
		index=index-1;
		for(int i=1;i<size;i++) {
			if(i==index) {
				Node temp=n.getPointer();
				n.setPointer(node);
				node.setPointer(temp);
				break;
			}
			n=n.getPointer();
		}
		size++;
	}

}
