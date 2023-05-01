<?php


require_once('./modelos/estado.php');


class DAOEstado
{

    public static function getEstados($user)
    {
        $sql = "SELECT * FROM syc_estados WHERE idJugador = :id";
        $params = array('id' => $user->id);
        $resultado = [];
        $resultado = BD::seleccionar($sql, $params);

        return $resultado;
    }
}