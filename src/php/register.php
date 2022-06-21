<?php
ini_set("display_errors",1);
error_reporting(E_ALL);
$dbhost = "localhost";
$db = "personenDaten";
$dbuser = "root";
$dbpassword = ""; 
 
$con = mysqli_connect($dbhost, $dbuser, $dbpassword, $db) or die("Database connection not established.");

$firstName = $_POST["firstName"];
$lastName = $_POST["lastName"];
$email = $_POST["email"];
$password = $_POST["password"];
$phoneNumber = $_POST["phoneNumber"];
$age = $_POST["yearOfBirth"];
$code = $_POST["code"];
$hasPhoto = $_POST["hasPhoto"];
$gender = $_POST["gender"];

//filter double mails
$query = "SELECT * FROM Registrierungsdaten WHERE email='{$email}'";
$result = mysqli_query($con,$query) or die(mysqli_error());

if(mysqli_num_rows($result) > 0){
	$msg = "email-exists-error" ;
	echo $msg;
	exit();
}

//to help preventing sql injection
$_first_name = mysqli_real_escape_string($con, $firstName);
$_last_name = mysqli_real_escape_string($con, $lastName);
$_email = mysqli_real_escape_string($con, $email);
$_phone_number = mysqli_real_escape_string($con, $phoneNumber);
$_password = mysqli_real_escape_string($con, $password);
$_age = mysqli_real_escape_string($con, $age);
$_code = mysqli_real_escape_string($con, $code);
$_gender = mysqli_real_escape_string($con, $gender);
$_hasphoto = mysqli_real_escape_string($con, $hasPhoto);

$data = "";

// perform validation
if(!preg_match("/^[a-zA-Z]*$/", $_first_name)) {
	$response = "first-name-error"; 
	echo $response;
	exit();
}
if(!preg_match("/^[a-zA-Z]*$/", $_last_name)) {
	$response = "last-name-error"; 
	echo $response;
	exit();
}
if(!preg_match("/^[0-9]{11}+$/", $_phone_number)) {
	$response = "phone-number-error"; 
	echo $response;
	exit();
}
if(!preg_match("/^(?=.*\d)(?=.*[@#\-_$%^&+=§!\?])(?=.*[a-z])(?=.*[A-Z])[0-9A-Za-z@#\-_$%^&+=§!\?]{6,20}$/", $_password)) {
	$response = "password-error"; 
	echo $response;
	exit();
}



if((preg_match("/^[a-zA-Z]*$/", $_first_name)) && (preg_match("/^[a-zA-Z]*$/", $_last_name)) &&
(preg_match("/^[0-9]{11}+$/", $_phone_number)) && (preg_match("/^(?=.*\d)(?=.*[@#\-_$%^&+=§!\?])(?=.*[a-z])(?=.*[A-Z])[0-9A-Za-z@#\-_$%^&+=§!\?]{8,20}$/", $_password))){
	$password_hash = password_hash($password, PASSWORD_DEFAULT);
	$query = "INSERT INTO Registrierungsdaten (firstName,lastName,phoneNumber, email, yearOfBirth, gender, hasPhoto, code, password_hash) VALUES ('{$firstName}','{$lastName}','{$phoneNumber}','{$email}','{$age}','{$gender}','{$hasPhoto}', '{$code}', '{$password_hash}')";
	$sql_query = mysqli_query($con, $query);

	if($sql_query){
		$response = "success"; 
		echo $response;
	}
	else{
		$response = "failed"; 
		echo $response;
	}
}	 
?>