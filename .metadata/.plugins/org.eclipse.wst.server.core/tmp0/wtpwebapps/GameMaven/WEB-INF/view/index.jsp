<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring 4 MVC - HelloWorld Index Page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'>
	$(document).ready(function() {

		var counterValue =0;
		//Populate UserList 

		$("#populateUserList").click(function() {

			counterValue=0;
			$.ajax({
				type : 'GET',
				url : "getUserList",
				success : function(data) {

					$("#tableUserDetailsBody").empty();
					var data2 = JSON.parse(data);
					for (i = 0; i < data2.length; i++) {
					counterValue = counterValue + 1;
						$("#tableUserDetailsBody").append("<tr><td id='"+counterValue+"'><input type='text' disabled='disabled' value='"+data2[i].user_id+"' id='userId"+counterValue+"' /></td> <td id='"+counterValue+"'><input id ='fname"+counterValue+"' type='text' value='"+data2[i].first_name+"' /></td> <td id='"+counterValue+"'><input id = 'email"+counterValue+"' type='text' value='"+data2[i].email_id+"' /></td> <td id='"+counterValue+"'><input id = 'password"+counterValue+"' type='text' value='"+data2[i].password+"' /></td> <td id='"+counterValue+"'><input type='hidden' id='user_id'> <button class='userEditClass' id='edit"+counterValue+"'>edit</button></td> </tr>");
						
					}
					
					$(".userEditClass").click(function(){
						
					
						 var tdId = $(this).closest('td').attr('id');
						 alert(tdId);
						var userIdValue = $("#userId"+tdId).val();
						alert(userIdValue);
						
						var user_id = $("#userId"+tdId).val();
						var first_name = $("#fname"+tdId).val();
						var email_id = $("#email"+tdId).val();
						var password = $("#password"+tdId).val();

						$.ajax({
							type : 'POST',
							url : "editUser",
							data : {
								user_id : user_id,
								first_name : first_name,
								email_id : email_id,
								password : password,
							},
							success : function(data) {

								alert("Successfully Saved");


							}
						});
						
				});
					
				}
			});
			
			

		});

		
		$(".userEditClass").click(function(){
			
			 	 var id = $(this).attr('id');
				 var currentId = id.match(/\d+/);
				 alert(id);
				 alert(currentId);
		});
		

		$("#saveForm").click(function() {

			//Collecting  values
			var first_name = $("#fname").val();
			var email_id = $("#email").val();
			var password = $("#password").val();

			$.ajax({
				type : 'POST',
				url : "addUser",
				data : {
					first_name : first_name,
					email_id : email_id,
					password : password,
				},
				success : function(data) {

					alert("Successfully Saved");


				}
			});

		});


	});
</script>

</head>
<body>

	<center>
		<h2>Hello World</h2>
		<h3>
			<a href="hello?name=Eric">Click Here</a>
		</h3>

		<form action="hello">
			<input type="text" name="myName"> <input type="submit"
				value="submit">
		</form>

		<form action="list">
			<input type="submit" value="list all Users">
		</form>

		<button id="populateUserList">Attempt</button>



		<br> <br> <input type="text" id="fname" name="fname"
			placeholder="fname"> <input type="text" id="email"
			name="email" placeholder="email"> <input type="text"
			id="password" name="password" placeholder="password">

		<button id="saveForm">Save</button>



<table id="tableUserDetails">
			<thead id="tableUserDetailsHead">
			<tr>
				<th>userId</th>
				<th>Name</th>
				<th>email</th>
				<th>password</th>
				<th>edit / Delete</th>

	</tr></thead>
	<tbody id="tableUserDetailsBody">
	</tbody>
</table>

	</center>
</body>
</html>