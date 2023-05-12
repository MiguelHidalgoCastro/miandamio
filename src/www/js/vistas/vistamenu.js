/**
  Vista del menú de navegación de la aplicación.
  Muestra los enlaces de contexto.
**/
import { Vista } from './vista.js'

export class VistaMenu extends Vista {
  /**
    Constructor de la clase.
    @param {Object} controlador Controlador de la vista principal.
    @param {Node} base Nodo al que se añadirá la vista principal.
  **/
  constructor (controlador, base) {
    super(controlador, 'flex')
    this.base = base
    
    // Cogemos referencias a los elementos del interfaz

    // Asociamos eventos
  }

  /**
    Muestra la vista seleccion.
  **/
  verVistaSeleccion () {
    this.limpiar()
    const h1 = document.createElement('h1')
    this.base.appendChild(h1)
    h1.appendChild(document.createTextNode('Vista Selección'))
    //this.crearEnlaceAVista2()
    this.base.appendChild(this.crearEnlaceAVistaDashboard())
  }

  /**
    Muestra la vista 2.
  **/
  verVistaDashboard () {
    this.limpiar()
    const h1 = document.createElement('h1')
    this.base.appendChild(h1)
    h1.appendChild(document.createTextNode('Vista Dashboard'))
    this.base.appendChild(this.crearEnlaceAVistaSeleccion())
  }
  
  /**
   * 
   */
  crearEnlaceAVistaSeleccion(){
    const a = document.createElement('a')
    a.appendChild(document.createTextNode('Ver Vista Seleccion'))
    a.onclick = this.controlador.verVistaSeleccion.bind(this.controlador)
    return a
  }

  /**
   * 
   * 
   */
  crearEnlaceAVistaDashboard(){
    const a = document.createElement('a')
    a.appendChild(document.createTextNode('Ver Vista Dashboard'))
    a.onclick = this.controlador.verVistaDashboard.bind(this.controlador)
    return a
  }

  /**
    Elimina los elementos del menú.
  **/
  limpiar () {
    this.eliminarHijos(this.base)
  }

  crearIconoAyuda (texto) {
    return this.crearIcono('help.svg', null, texto)
  }
}
