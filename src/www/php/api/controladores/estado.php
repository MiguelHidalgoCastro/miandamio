<?php

require_once('./daos/daoestado.php');
require_once('./modelos/estado.php');

class EstadoController
{
    function post($pathParams, $queryParams, $user)
    {
        global $config;
        $estado = DAOEstado::getEstados($user);
        sleep(1);
        if (!$estado) {
            header('HTTP/1.1 404 Not Found');
            die();
        }
        header('Content-type: application/json; charset=utf-8');
        header('HTTP/1.1 200 OK');
        die();
    }
}
