<?php
header("Access-Control-Allow-Origin: *");

   // Define database connection parameters
   $hn      = 'localhost';
   $un      = 'root';
   $pwd     = 'abc123';
   $db      = 'InventoryManager';
   $cs      = 'utf8';

   // Set up the PDO parameters
   $dsn 	= "mysql:host=" . $hn . ";port=3306;dbname=" . $db . ";charset=" . $cs;
   $opt 	= array(
                        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
                        PDO::ATTR_EMULATE_PREPARES   => false,
                       );
   // Create a PDO instance (connect to the database)
   $pdo 	= new PDO($dsn, $un, $pwd, $opt);


   // Retrieve the posted data
   $json    =  file_get_contents('php://input');
   $obj     =  json_decode($json);
   $key     =  strip_tags($obj->key);


   // Determine which mode is being requested
   switch($key)
   {

      // Add a new record to the technologies table
      case "create":

         // Sanitise URL supplied values
         $nome 		  = filter_var($obj->nome, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $patrimonio	  = filter_var($obj->patrimonio, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $rotulo         = filter_var($obj->rotulo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $local         = filter_var($obj->local, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

         // Attempt to run PDO prepared statement
         try {
            $sql 	= "INSERT INTO products(NomeProduto, Patrimonio, RotuloProduto, Localizacao) VALUES(:nome, :patrimonio, :rotulo, :local)";
            $stmt 	= $pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome, PDO::PARAM_STR);
            $stmt->bindParam(':patrimonio', $description, PDO::PARAM_STR);
            $stmt->bindParam(':rotulo', $description, PDO::PARAM_STR);
            $stmt->bindParam(':local', $description, PDO::PARAM_STR);
            $stmt->execute();

            echo json_encode(array('message' => 'Item ' . $nome . ' adicionado ao banco com sucesso.'));
         }
         // Catch any errors in running the prepared statement
         catch(PDOException $e)
         {
            echo $e->getMessage();
         }

      break;



      // Update an existing record in the technologies table
      case "update":

         // Sanitise URL supplied values
         $nome          = filter_var($obj->nome, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $patrimonio    = filter_var($obj->patrimonio, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $rotulo        = filter_var($obj->rotulo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $local         = filter_var($obj->local, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $recordID	   = filter_var($obj->recordID, FILTER_SANITIZE_NUMBER_INT);

         // Attempt to run PDO prepared statement
         try {
            $sql 	= "UPDATE products SET NomeProduto = :nome, Patrimonio = :patrimonio, RotuloProduto = :rotulo WHERE id = :recordID";
            $stmt 	=	$pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome, PDO::PARAM_STR);
            $stmt->bindParam(':patrimonio', $description, PDO::PARAM_STR);
            $stmt->bindParam(':rotulo', $description, PDO::PARAM_STR);
            $stmt->bindParam(':local', $description, PDO::PARAM_STR);
            $stmt->bindParam(':recordID', $recordID, PDO::PARAM_INT);
            $stmt->execute();

            echo json_encode('O item ' . $nome . ' foi atualizado com sucesso.');
         }
         // Catch any errors in running the prepared statement
         catch(PDOException $e)
         {
            echo $e->getMessage();
         }

      break;



      // Remove an existing record in the technologies table
      case "delete":

         // Sanitise supplied record ID for matching to table record
         $recordID	=	filter_var($obj->recordID, FILTER_SANITIZE_NUMBER_INT);

         // Attempt to run PDO prepared statement
         try {
            $pdo 	= new PDO($dsn, $un, $pwd);
            $sql 	= "DELETE FROM products WHERE id = :recordID";
            $stmt 	= $pdo->prepare($sql);
            $stmt->bindParam(':recordID', $recordID, PDO::PARAM_INT);
            $stmt->execute();

            echo json_encode('O item ' . $nome . ' foi deletado com sucesso.');
         }
         // Catch any errors in running the prepared statement
         catch(PDOException $e)
         {
            echo $e->getMessage();
         }

      break;
   }

?>