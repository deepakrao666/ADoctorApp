package com;

public class ToStringOver {

	public static void main(String[] args) {
		
		Emp e = new Emp();
		Emp e1 = new Emp();
		
		System.out.println(e.equals(e1));
		
	}

}

class Emp{
	
	int age;
	String name;
	
	
	@Override
	public String toString() {
		return "age : "+age+", name : "+name;
		
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Emp other = (Emp) obj;
		if (age != other.age)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	

	
	
}
