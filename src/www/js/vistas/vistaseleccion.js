/**
  Vista1.
**/

import { Vista } from './vista.js'

export class VistaSeleccion extends Vista {
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista.
    @param {Node} base Nodo al que se añadirá la vista.
  **/
  constructor(controlador, base) {
    super(controlador)
    this.base = base
    // Cogemos referencias a los elementos del interfaz
    this.btnLogOut = document.getElementById('logOut')
    // Asociamos eventos
    this.btnLogOut.onclick = this.logout.bind(this)

  }

  getUser() {
    // obtengo lo que tengo guardado en el local storage
    var user = JSON.parse(sessionStorage.getItem('usuario'))
    //lo que tengo en el session storage
    this.controlador.getUser(user)
  }

  logout() {
    this.controlador.logout()
  }

  mostrarPartidasEmpezadas(array) {

    let container = document.getElementById('menuPartidas')
    //Titulo
    let div = document.createElement('div')
    div.setAttribute('class', 'row mt-3')
    let h3 = document.createElement('h3')
    h3.setAttribute('class', 'ms-4')
    h3.textContent = 'CIUDADES EMPEZADAS'
    div.appendChild(h3)
    container.appendChild(div)


    array.forEach(element => {
      // Object { idEstado: 1, idJugador: 3, idPartida: 1, idConcesionario: 1, dinero: 50000, reputacion: 70, puntuacion: 0 }
      let div0 = document.createElement('div')
      div0.setAttribute('class', 'row mt-2')
      let div2 = document.createElement('div')
      div2.setAttribute('class', 'col-12')
      let div2_1 = document.createElement('div')
      div2_1.setAttribute('class', 'card')
      let div2_1_1 = document.createElement('div')
      div2_1_1.setAttribute('class', 'card-body')
      let h5 = document.createElement('h5')
      h5.setAttribute('class', 'card-title')
      h5.textContent = 'CUIDAD ID: ' + element.idPartida
      let p = document.createElement('p')
      p.setAttribute('class', 'card-text')
      p.textContent = 'Dinero: ' + element.dinero + '\r\n Reputacion: ' + element.reputacion + '\n Puntuación: ' + element.puntuacion

      let btnEntrarCiudad = document.createElement('button')
      btnEntrarCiudad.setAttribute('class', 'btn btn-primary float-end')
      btnEntrarCiudad.setAttribute('id', element.idPartida + ',' + element.idJugador)
      btnEntrarCiudad.textContent = 'CONTINUAR'


      div2_1_1.appendChild(h5)
      div2_1_1.appendChild(p)
      div2_1_1.appendChild(btnEntrarCiudad)
      div2_1.appendChild(div2_1_1)
      div2.appendChild(div2_1)
      div0.appendChild(div2)
      container.appendChild(div0)
    });
  }

  mostrarPartidasDisponibles(array) {

    let container = document.getElementById('menuPartidas')
    //Titulo
    let div = document.createElement('div')
    div.setAttribute('class', 'row mt-5')
    let h3 = document.createElement('h3')
    h3.setAttribute('class', 'ms-4')
    h3.textContent = 'CIUDADES DISPONIBLES'
    div.appendChild(h3)
    container.appendChild(div)

    array.forEach(element => {

      let div0 = document.createElement('div')
      div0.setAttribute('class', 'row mt-2')
      let div2 = document.createElement('div')
      div2.setAttribute('class', 'col-12')
      let div2_1 = document.createElement('div')
      div2_1.setAttribute('class', 'card')
      let div2_1_1 = document.createElement('div')
      div2_1_1.setAttribute('class', 'card-body')
      let h5 = document.createElement('h5')
      h5.setAttribute('class', 'card-title')
      h5.textContent = element.nombreCiudad
      let p = document.createElement('p')
      p.setAttribute('class', 'card-text')
      p.textContent = 'Usuarios Registrados: 127'


      let btnRegistrarseACiudad = document.createElement('button')
      btnRegistrarseACiudad.setAttribute('class', 'btn btn-primary float-end')
      btnRegistrarseACiudad.setAttribute('id', element.idCiudad)
      btnRegistrarseACiudad.textContent = 'INICIAR'

      div2_1_1.appendChild(h5)
      div2_1_1.appendChild(p)
      div2_1_1.appendChild(btnRegistrarseACiudad)
      div2_1.appendChild(div2_1_1)
      div2.appendChild(div2_1)
      div0.appendChild(div2)
      container.appendChild(div0)


      // p.textContent =
      //   'idCiudad:' + element.idCiudad +
      //   ' nombreCiudad:' + element.nombreCiudad +
      //   ' idEstructuraPartida:' + element.idEstructuraPartida +
      //   ' fechaInicioPartida:' + element.fechaInicioPartida +
      //   ' publicado:' + element.publicado +
      //   ' dineroInicial:' + element.dineroInicial +
      //   ' reputacionInicial:' + element.reputacionInicial +
      //   ' cantidadCochesInicial:' + element.cantidadCochesInicial +
      //   ' puntuacionVenta:' + element.puntuacionVenta +
      //   ' puntuacionCompra:' + element.puntuacionCompra

    });
  }
}
