<?php

/**
		DAO de Usuario.
		Objeto para el acceso a los datos relacionados con usuarios.
 **/

require_once('./modelos/usuario.php');


class DAOUsuario
{
	/**
		Consulta la base de datos para autenticar al usuario y devolver sus datos.
		El email ha sido autenticado por Google.
		@param $login Login Modelo de login.
		@return Usuario Devuelve los datos del usuario o false si no existe el usuario.
	 **/
	public static function autenticarLogin($login)
	{
		$usuario = new Usuario();

		$sql = "SELECT idJugador FROM syc_jugadores WHERE nick = :nick AND pass = :pass";

		$params = array('nick' => $login->usuario, 'pass' => $login->clave);
		$resultado = [];
		$resultado = BD::seleccionar($sql, $params);

		return DaoUsuario::crearUsuario($resultado);
	}




	public static function autenticarLogin_new($login)
	{

		$sql = "SELECT idJugador, pass FROM syc_jugadores WHERE nick = :nick";
		$params = array('nick' => $login->usuario);
		$consulta = BD::mySelect($sql, $params);
		$user = new Usuario();

		if ($consulta->rowCount()) {
			$u = $consulta->fetch(PDO::FETCH_OBJ);
			if (password_verify($login->clave, $u->pass)) {
				$user->idJugador = $u->idJugador;
				return $user;
			}
		} else return false;
	}


	/**
		Consulta la base de datos para autenticar al usuario y devolver sus datos.
		El email ha sido autenticado por Google.
		@param $email Email del usuario.
		@return {Usuario} Devuelve los datos del usuario o false si no existe el usuario.
	 **/
	public static function autenticarEmail($email)
	{

		$sql  = 'SELECT ...';
		$sql .= 'WHERE email = :email';

		$params = array('email' => $email);
		$resultado = [];
		//$resultado = BD::seleccionar($sql, $params);

		return DaoUsuario::crearUsuario($resultado);
	}

	private static function crearUsuario($resultSet)
	{
		$usuario = new Usuario();

		if (count($resultSet) == 1) {
			//Asignamos los datos del usuario a $usuario
			$usuario->idJugador = $resultSet[0]['idJugador'];

		} else return false;
		return $usuario;
	}
}
