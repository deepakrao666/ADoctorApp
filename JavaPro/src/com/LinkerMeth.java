package com;

public class LinkerMeth {
	
	static int size = 0;
	static private Linker start;
	static private Linker end;
	
	public void insertFirst(String value) {

		Linker linker = new Linker(value, null);
		size++;
		if (start == null) {
			
			start = linker;
			end = start;
		
		} else {
			
			linker.setNext(start);
			start = linker;
		}

	}
	
	
	
	public void display() {
		if(size == 0) {
			System.out.println("empty");
			return;
		}
		
	
	}
	

}
