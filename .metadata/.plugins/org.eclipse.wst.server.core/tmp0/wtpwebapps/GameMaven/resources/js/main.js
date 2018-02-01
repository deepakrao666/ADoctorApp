function exists(){
	alert("this");
	
}
function checkMatchingPasswords()
{	
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('cpassword');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(pass1.value == pass2.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
    	pass1.style.backgroundColor = goodColor;
    	pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        return true;	
        	
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
    	pass1.style.backgroundColor = badColor;
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        alert("Password does not match");
        return false;
    }
    
 
}  
