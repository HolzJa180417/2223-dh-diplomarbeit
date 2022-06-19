<?php
$dbhost = "localhost";
$db = "personalDaten";
$dbuser = "jakob";
$dbpassword = "test"; 
 
$con = mysqli_connect($dbhost,$dbuser,$dbpassword,$db);
 
$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);
 
$fistName = $obj['firstName'];
$secondName = $obj['secondName'];
$email = $obj['email'];
$password = $obj['password'];
$phoneNumber = $obj['phoneNumber'];
$age = $obj['yearOfBirth'];
$code = $obj['code'];
$hasPhoto = $obj['hasPhoto'];
$gender = $obj['gender'];

//filter double mails
$CheckSQL = "SELECT * FROM Registrierungsdaten WHERE email='$email'";
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));

if(isset($check)){

	$emailExist = 'Email Already Exist, Please Try Again With New Email Address!';
    header('Content-Type: application/json');
	echo json_encode($emailExist); 

  }
 else{
	 $Sql_Query = "insert into Registrierungsdaten (firstName,lastName,phoneNumber, email, yearOfBirth, gender, hasPhoto, id, code) values ('$fistName','$lastName','$phoneNumber','$email''$yearOfBirth','$gender','$hasPhoto','$id', '$code')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		$msg = 'User Registered Successfully' ;
        header('Content-Type: application/json');
		echo json_encode($msg);
	 
	 }
	 else{
		echo 'Try Again';
	 }
 }
 mysqli_close($con);
?>