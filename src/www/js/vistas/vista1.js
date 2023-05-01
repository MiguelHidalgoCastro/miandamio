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
    this.btnUser.onclick = this.getUser.bind(this)
    this.btnLogOut.onclick = this.logout.bind(this)

  }

  getUser() {
    // obtengo lo que tengo guardado en el local storage
    var user = JSON.parse(sessionStorage.getItem('usuario'))
    this.controlador.getUser(user)
  }

  logout() {
    this.controlador.logout()
  }
}
