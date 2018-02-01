package linkedList;

public class Link {
	public String link;
	public int number;
	public Link next; 

	public Link(String link, int number){
		this.link = link;
		this.number = number;
	}
	
	public void display(){
		System.out.println(link + ": " + number + ", Sold");
	}
	
	public String toString(){
		return link;
		
	}
	
	public static void main(String[] args) {
		
		LinkList theLinkedList = new LinkList();

		theLinkedList.insertFirstLink("three", 333);
		theLinkedList.insertFirstLink("tow", 222);
		theLinkedList.insertFirstLink("one", 111);
		theLinkedList.insertFirstLink("zero", 100);

		theLinkedList.display();
		
		System.out.println("Value of first in LinkedList " + theLinkedList.firstLink + "\n");
		
		theLinkedList.removeFirst();
		theLinkedList.display();
		
		System.out.println(theLinkedList.find("one").link + " Was Found");
		
		theLinkedList.removeLink("two");
		
		System.out.println("\n222 removed\n");
		
		theLinkedList.display();
		
	}
	
}