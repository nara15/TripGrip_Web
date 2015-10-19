<?php
 	require_once("Rest.php");
	
	class API extends REST 
	{
	
		public $data = "";
		
		const DB_SERVER = "mysql17.000webhost.com";
		const DB_USER =  "a9921749_mario";
		const DB_PASSWORD = "mario123456";
		const DB = "a9921749_DB";

		private $db = NULL;
		private $mysqli = NULL;

		public function __construct()
		{
			parent::__construct();				// Iniciar el constructor del padre
			$this->dbConnect();					// Inicar la coneción a la base de datos
		}
		
		/*
		 *  Conectarse a la base de datos
		*/
		private function dbConnect()
		{
			$this->mysqli = new mysqli(self::DB_SERVER, self::DB_USER, self::DB_PASSWORD, self::DB);
		}
		
		/*
		 * Dinámicamente se llama el método basado en el url de llamada
		 */
		public function processApi()
		{
			$func = strtolower(trim(str_replace("/","",$_REQUEST['x'])));
			if((int)method_exists($this,$func) > 0)
				$this->$func();
			else
				$this->response('',404); // Si el método no existe dentro de la clase: "Page not found".
		}

		//Obtener los datos de todas las personas
		private function getPersonas()
		{
			if($this->get_request_method() != "GET")
			{
				$this->response('', 406);
			}
			else
			{
				$query = "SELECT * FROM Persona";
				$r = $this->mysqli->query($query) or die($this->mysqli->error.__LINE__);
				if($r->num_rows > 0)
				{
					$result = array();
					while($row = $r->fetch_assoc()){
						$result[] = $row;
					}
					$this->response($this->json($result), 200); // se envían los detalles
				}
				else
				{
					$this->response('',204);	// Si no hay resultados "No Content" status
				}
			}
		}

		/*
		 *	Se convierte el arreglo en JSON
		*/
		private function json($data){
			if(is_array($data)){
				return json_encode($data);
			}
		}
	}
	
	// Se inicia la librería
	$api = new API;
	$api->processApi();
?>