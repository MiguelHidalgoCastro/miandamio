/**
  Vista1.
**/

import { Vista } from './vista.js'

export class Vista1 extends Vista {
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
    @param {Node} base Nodo al que se añadirá la vista.
  **/
  constructor(controlador, base) {
    super(controlador)
    this.base = base

    // Cogemos referencias a los elementos del interfaz
    this.btnUser = document.getElementById('usuario')
    this.btnLogOut = document.getElementById('logOut')
    // Asociamos eventos
    //this.btnUser.onclick = this.getUser.bind(this)
    this.btnLogOut.onclick = this.logout.bind(this)

  }

  getUser() {
    // obtengo lo que tengo guardado en el local storage
    var user = JSON.parse(sessionStorage.getItem('usuario'))
    //lo que tengo en el session storage
    // console.log(user);
    this.controlador.getUser(user)
  }

  logout() {
    this.controlador.logout()
  }

  mostrarPartidasEmpezadas(array) {
    let div = document.getElementById('partidasEmpezadas')

    array.forEach(element => {
      let p = document.createElement('p')
      //Object { idEstado: 1, idJugador: 3, idPartida: 1, idConcesionario: 1, dinero: 50000, reputacion: 70, puntuacion: 0 }
      p.textContent = 'idEstado:' + element.idEstado + ' idJugador:' + element.idJugador + ' idPartida:' + element.idPartida + ' idConcesionario:' + element.idConcesionario + ' dinero:' + element.dinero + ' reputacion:' + element.reputacion + ' puntuacion:' + element.puntuacion
      div.appendChild(p)
    });
  }

  mostrarPartidasDisponibles(array) {
    let div = document.getElementById('partidasDisponibles')

    array.forEach(element => {
      let p = document.createElement('p')
      p.textContent =
        'idCiudad:' + element.idCiudad +
        ' nombreCiudad:' + element.nombreCiudad +
        ' idEstructuraPartida:' + element.idEstructuraPartida +
        ' fechaInicioPartida:' + element.fechaInicioPartida +
        ' publicado:' + element.publicado +
        ' dineroInicial:' + element.dineroInicial +
        ' reputacionInicial:' + element.reputacionInicial +
        ' cantidadCochesInicial:' + element.cantidadCochesInicial +
        ' puntuacionVenta:' + element.puntuacionVenta +
        ' puntuacionCompra:' + element.puntuacionCompra
      div.appendChild(p)
    });
  }
}
