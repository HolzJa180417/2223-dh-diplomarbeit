<?php 
  ini_set("display_errors",1);
  error_reporting(E_ALL);
  $dbhost = "localhost";
  $db = "personenDaten";
  $dbuser = "root";
  $dbpassword = ""; 
   
  $con = mysqli_connect($dbhost, $dbuser, $dbpassword, $db) or die("Database connection not established.");

  //check if there is data
  if(isset($_POST["email"]) && isset($_POST["password"])){

    $email = $_POST["email"];
    $password = $_POST["password"];

    $_email = mysqli_real_escape_string($con, $email);

    //check if mail even exists
    $query = "SELECT * FROM Registrierungsdaten WHERE email='{$_email}'";
    $result = mysqli_query($con, $query);

    //if the email does not exist
    if(mysqli_num_rows($result) == 0){
      $msg = "email-not-exists-error" ;
	    echo $msg;
	    exit();
    }

    //get password hash for given mail
    $query = "SELECT * FROM Registrierungsdaten WHERE email='{$email}'";
    $result = mysqli_query($con, $query);
    
    while($row = mysqli_fetch_array($result)) {
      $id = $row['id'];
      $firstname = $row['firstName'];
      $lastname = $row['lastName'];
      $email = $row['email'];
      $mobilenumber = $row['phoneNumber'];
      $db_password = $row['password_hash'];
      $gender = $row['gender'];
      $hasPhoto = $row['hasPhoto'];
      $age = $row['yearOfBirth'];
      $code = $row['code'];
    }

    $_password = password_verify($password, $db_password);

    //if the email and password is correct
    if($_password == $password && $_email == $email) {
      $msg = "success" ;
	    echo $msg;
	    exit();
    }
    else{
      $msg = "password-not-correct-error" ;
	    echo $msg;
	    exit();
    }
  }
?>