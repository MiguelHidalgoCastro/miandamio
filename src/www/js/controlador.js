/**
  Controlador principal de la aplicación.
**/

// Cargamos los Modelos
import { Modelo } from './modelos/modelo.js'

// Cargamos las Vistas
import { VistaMenu } from './vistas/vistamenu.js'
import { VistaSeleccion } from './vistas/vistaseleccion.js'
import { VistaDashboard } from './vistas/vistadashboard.js'

// Cargamos los Servicios
import { Rest } from './servicios/rest.js'

/**
  Controlador principal de la aplicación.
**/
class App {
  #usuario = null // Usuario logeado.

  constructor() {
    window.onload = this.iniciar.bind(this)
    window.onerror = function (error) { console.log('Error capturado. ' + error) }
  }

  /**
    Inicia la aplicación y muestra la vista1.
    Se llama al cargar la página.
  **/
  iniciar() {
    //Comprobar login
    this.#usuario = sessionStorage.getItem('usuario')
    // console.log(this.#usuario)
    if (!this.#usuario)
      window.location.href = 'login.html' //Falta informar al usuario del error.
    Rest.setAutorizacion(this.#usuario.autorizacion)
    this.modelo = new Modelo()
    this.vistaMenu = new VistaMenu(this, document.getElementById('divMenu'))
    this.vistaSeleccion = new VistaSeleccion(this, document.getElementById('divVistaSeleccion'))
    this.vistaDashboard = new VistaDashboard(this, document.getElementById('divVistaDashboard'))




    //pasar los datos a la vista de ciudades
    this.verVistaSeleccion()

    //traer datos
    this.getUser()
    this.getPartidas()
  }

  /**
    Muestra el error en la vista de mensajes.
    @param error {Error} Error que se ha producido.
  **/
  gestionarError(error) {
    console.error(error)
  }

  /**
    Recibe el token del login con Google y lo envía al servidor para identificar al usuario.
    @param token {Object} Token de identificación de usuario de Google.
  **/
  loginGoogle(token) {
    Rest.post('login', [], token.credential, true)
      .then(usuario => {
        this.#usuario = usuario
        Rest.setAutorizacion(this.#usuario.autorizacion)
        this.vistaMenu.mostrar(true)
        this.vistaLogin.mostrar(false)
        switch (usuario.rol) {
          case 'alumno':
            this.mostrarTareasAlumno(this.#usuario)
            break
          case 'profesor':
            this.mostrarAlumnos()
            break
          default:
            console.error(`Rol de usuario desconocido: ${usuario.rol}`)
        }
      })
      .catch(e => { this.vistaLogin.mostrarError(e) })
  }

  /**
    Cierra la sesión del usuario.
  **/
  logout() {
    sessionStorage.removeItem('usuario')
    this.#usuario = null
    Rest.setAutorizacion(null)
    window.location.href = 'login.html'
  }

  verVistaSeleccion() {
    this.vistaMenu.verVistaSeleccion()
    this.ocultarVistas()
    this.vistaSeleccion.mostrar()
  }
  verVistaDashboard() {
    this.vistaMenu.verVistaDashboard()
    this.ocultarVistas()
    this.vistaDashboard.mostrar()
  }
  /**
    Oculta todas las vistas.
  **/
  ocultarVistas() {
    this.vistaSeleccion.mostrar(false)
    this.vistaDashboard.mostrar(false)
  }


  getUser() {
    let u = JSON.parse(this.#usuario)
    const user2 = {
      id: u.idJugador
    }

    Rest.post('estado', [], user2, true)
      .then(
        estados => {
          // console.log(estados)

          //tengo que traerme las ciudades
          this.vistaSeleccion.mostrarPartidasEmpezadas(estados)
        }
      )
      .catch(error => console.log(error))
  }

  getPartidas() {
    Rest.get('ciudad')
      .then(
        partidas => {
          this.vistaSeleccion.mostrarPartidasDisponibles(partidas)
        }
      )
      .catch(error => console.log(error))
  }


  getCiudades() {
    // console.log(user);

  }
}


/* eslint-disable no-new */
new App()
