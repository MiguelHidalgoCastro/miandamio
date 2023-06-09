<?php
require_once('./modelos/estado.php');

class DAOEstado
{

    public static function getEstados($user)
    {
        $sql = "SELECT * FROM syc_estados WHERE idJugador = :id";
        $params = array('id' => $user->id);
        return BD::seleccionar($sql, $params);
    }

    public static function getAllCities(){
        $sql = "SELECT * FROM syc_ciudades WHERE publicado = 'SI'";
        $params = [];
        return BD::seleccionar($sql, $params);
    }

}
