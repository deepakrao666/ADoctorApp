package test;

public class CustomEx {

	public static void main(String[] args) throws CustException{
		
		throw new CustException();
	}
}


class CustException extends Exception
{

CustException(){
	super();
}

CustException(String msg){
	super(msg);
}

}