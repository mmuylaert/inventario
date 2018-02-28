<?php
   include("db/dbconn.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $myusername = mysqli_real_escape_string($link,$_POST['username']);
      $mypassword = mysqli_real_escape_string($link,$_POST['password']); 
      
      $sql = "SELECT id FROM login WHERE usuario = '$myusername' and senha = '$mypassword'";
      $result = mysqli_query($link,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      //$active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
    
      if($count == 1) {
         
         $_SESSION['login_user'] = $myusername;
         
         header("location: produtos.php");
      }else {
         $error = "Usuario ou senha invalidos";
      }
   }
?>
<html>
   
   <head>
      <title>Inventario Grandes Lagos</title>
      
      <style type = "text/css">
         body {
            font-family:Arial, Helvetica, sans-serif;
            font-size:14px;
         }
         label {
            font-weight:bold;
            width:100px;
            font-size:14px;
         }
         .box {
            border:#666666 solid 1px;
         }
      </style>
      
   </head>
   
   <body bgcolor = "#FFFFFF">

    <h1 align="center" style="margin-top: 10%;">Inventario Grandes Lagos</h1>
  
      <div align = "center" style="margin-top: 30px;">
         <div style = "width:300px; border: solid 1px #333333; " align = "left">
            <div style = "background-color:#333333; color:#FFFFFF; padding:3px;"><b>Login</b></div>
        
            <div style = "margin:30px">
               
               <form action = "" method = "post">
                  <label>Usuario:</label><input style="margin-left: 5px;" type = "text" name = "username" class = "box"/><br /><br />
                  <label>Senha:</label><input style="margin-left: 15px;" type = "password" name = "password" class = "box" /><br/><br />
                  <input type = "submit" value = "Entrar" style="margin-left: 95px;"/><br />
               </form>
               
               
          
            </div>
        
         </div>
      
      </div>

   </body>
</html>