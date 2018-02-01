package com;

public class Linker {
	
	private String value;
	
	private Linker next;

	public Linker(String value, Linker next) {
		super();
		this.value = value;
		this.next = next;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Linker getNext() {
		return next;
	}

	public void setNext(Linker next) {
		this.next = next;
	}

	public Linker() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
