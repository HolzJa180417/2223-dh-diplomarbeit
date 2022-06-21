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

    //get password hash for given mail
    $query = "SELECT password_hash FROM Registrierungsdaten WHERE email='{$email}'";
    $result = mysqli_query($con, $query);
    $hashed_password = mysqli_fetch_array($result);
    echo $hashed_password;

    //if the email and password is correct
    if(password_verify($password, strval($hashed_password))) {
      $msg = "success" ;
	    echo $msg;
	    exit();
    }
    else{
      $msg = "password-not-correct-error" ;
	    echo $msg;
	    exit();
    }

    //check if mail even exists
    $query = "SELECT * FROM Registrierungsdaten WHERE email='{$email}'";
    $result = mysqli_query($con, $query);

    //if the email does not exist
    if(mysqli_num_rows($result) == 0){
      $msg = "email-not-exists-error" ;
	    echo $msg;
	    exit();
    }
  }
?>