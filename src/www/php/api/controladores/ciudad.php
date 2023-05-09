<?php
require_once('./daos/daociudad.php');
require_once('./modelos/ciudad.php');

class CiudadController
{

    function get($pathParams, $queryParams, $usuario)
    {
        global $config;
        $ciudades = DAOCiudad::getCiudades('SI');

        if (!$ciudades) {
            header('HTTP/1.1 404 Not Found');
            die();
        }
        //encapsulo los datos
        $jsonciudades = json_encode($ciudades);
        header('Content-type: application/json; charset=utf-8');
        header('HTTP/1.1 200 OK');
        echo $jsonciudades;
        die();
    }
}
