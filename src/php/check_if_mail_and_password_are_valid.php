<?php 
  $db = "personalDaten"; //database name
  $dbuser = "jakob"; //database username
  $dbpassword = "test"; //database password
  $dbhost = "localhost"; //database host

  $return["error"] = false;
  $return["message"] = "";
  $return["success"] = false;

  $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);

  if(isset($_POST["username"]) && isset($_POST["password"])){
       //checking if there is POST data
       $email = $_POST["email"];
       $password = $_POST["password"];

       $email = mysqli_real_escape_string($link, $email);
       //escape inverted comma query conflict from string

       $sql = "SELECT * FROM Registrierungsdaten WHERE email = '$email'";
       //building SQL query
       $res = mysqli_query($link, $sql);
       $numrows = mysqli_num_rows($res);
       //check if there is any row
       if($numrows > 0){
           //is there is any data with that username
           $obj = mysqli_fetch_object($res);
           //get row as object
           if(md5($password) == $obj->password){
               $return["success"] = true;
               $return["id"] = $obj->id;
               $return["firstName"] = $obj->firstName;
               $return["lastName"] = $obj->lastName;
               $return["gender"] = $obj->gender;
               $return["email"] = $obj->email;
               $return["code"] = $obj->code;
               $return["hasPhoto"] = $obj->hasPhoto;
               $return["phoneNumber"] = $obj->phoneNumber;
               $return["age"] = $obj->age;
           }else{
               $return["error"] = true;
               $return["message"] = "Your Password is Incorrect.";
           }
       }else{
           $return["error"] = true;
           $return["message"] = 'Your email was not found.';
       }
  }else{
      $return["error"] = true;
      $return["message"] = 'Send all parameters.';
  }

  mysqli_close($link);

  header('Content-Type: application/json');
  echo json_encode($return);
?>