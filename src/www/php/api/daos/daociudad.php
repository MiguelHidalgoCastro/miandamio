<?php
require_once('./modelos/ciudad.php');

class DAOCiudad
{

    public static function getCiudades($publicado)
    {
        $sql = "SELECT * FROM syc_ciudades WHERE publicado = :publicado";
        $params = array('publicado' => $publicado);
        return BD::seleccionar($sql, $params);
    }
}
