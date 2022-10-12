import wollok.game.*
import visuales.*
import factories.*
import nivel.*
//import score.*

class Peces inherits Visual{
	var property puntos
	    
	method colisionadoPor(personaje) {
		personaje.comer(self)
 		nivel.ubicarAleatoriamente(self)
	}

	
}
const globo = new Peces( image = "globoM.png",puntos = -20) 
const pez10 = new Peces( image = "pez10R.png",puntos = 10) 
const pez15 = new Peces( image = "pez15C.png",puntos = 15) 
const pez20 = new Peces( image = "pez20V.png",puntos = 20) 



object pulpo inherits Visual(image= "pulpo.png", position = new Position(x=3,y=2)) {
	var property puntos = 35
	method colisionadoPor(personaje) { 
		game.removeVisual(self)
 		game.addVisual(tinta) 		 		
	}
}

object tinta inherits Visual(image = "tinta.png", position = new Position(x=3,y=3)) {
	
	method colisionadoPor(visual){
		 nivel.ubicarAleatoriamente(self)
		 game.addVisual(self) 		 	//COMO HAGO PARA QUE APAREZCAN MUCHAS TINTAS?	
		 
	}
}

object abisal inherits Visual(image= "abisal.png", position = new Position(x=2,y=2)) { //COMO HAGO PARA QUE LA PRIMERA POSICION SEA AL AZAR???
	var property puntos = -35
	method colisionadoPor(personaje) { 
		game.addVisual(pantallaOscura)
		nivel.ubicarAleatoriamente(self)
		game.schedule(4000, { game.removeVisual(pantallaOscura) })
	}
}

object pantallaOscura inherits Visual(image = "pantallaOscura.png", position = new Position(x=0,y=0)) {
	
}

object medusa inherits Visual(image= "medusa.png", position = new Position(x=5,y=3)) {
	var property puntos = -15
	
	method colisionadoPor(personaje) { 
		movimiento.configurarFlechasElectrocutado(sheldon)
		movimiento.configurarFlechasElectrocutado(sheldon)
		game.removeVisual(self) //elimino la medusa porque sino se hace lio con las flechas
		game.schedule(5000, { movimiento.configurarFlechas(sheldon) movimiento.configurarFlechas(sheldon) })
	}
}

object tiburon inherits Visual(image= "tiburon.png", position = new Position(x=9,y=1)) {
	
	method nadar() {
		
	position = position.left(1) 
		
		/*COMO HACER PARA QUE EL TIBURON VAYA Y VUELVA??? */
    }
	
	method colisionadoPor(personaje) { 
		game.say(self, "Perdedor!!")
	}	
}

