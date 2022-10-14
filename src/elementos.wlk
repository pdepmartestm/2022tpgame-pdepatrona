import wollok.game.*
import visuales.*
import factories.*
import nivel.*


class Peces inherits Visual{
	const property puntos
	    
	method colisionadoPor(personaje) {
		personaje.comer(self)
 		nivel.ubicarAleatoriamente(self)
	}
}
const globo = new Peces( image = "globoM.png",puntos = -20) 
const pez10 = new Peces( image = "pez10R.png",puntos = 10) 
const pez15 = new Peces( image = "pez15C.png",puntos = 15) 
const pez20 = new Peces( image = "pez20V.png",puntos = 20) 
const pez30 = new Peces( image = "pez30.png", puntos = 30)


object pulpo inherits Visual(image= "pulpo.png", position = new Position(x=3,y=2)) {
	const property puntos = 35
	method colisionadoPor(personaje) { 
		personaje.comer(self)
		game.removeVisual(self)
 		game.addVisual(tinta) 		 		
	}
}

object abisal inherits Visual(image= "abisal.png", position = new Position(x=2,y=2)) { //COMO HAGO PARA QUE LA PRIMERA POSICION SEA AL AZAR???
	const property puntos = -35
	method colisionadoPor(personaje) { 
		personaje.comer(self)
		game.addVisual(pantallaOscura)
		game.sound("cortasteTodaLaLoz.mp3").play()
		
		nivel.ubicarAleatoriamente(self)
		game.schedule(4000, { game.removeVisual(pantallaOscura) })
	}
}

object medusa inherits Visual(image= "medusa.png", position = new Position(x=5,y=3)) {
	const property puntos = -15
	
	method colisionadoPor(personaje) { 
		personaje.comer(self)
		sheldon.image("sheldonSacaLaManoDeAhiCarajo.png") //https://www.youtube.com/watch?v=6UlasOF_ee0 
		game.sound("sacaLaManoDeAhi.mp3").play()
		
		movimiento.configurarFlechasElectrocutado(sheldon)
		nivel.ubicarAleatoriamente(self)
		game.schedule(4000, { sheldon.image("sheldon.png") movimiento.configurarFlechas(sheldon)})
	}
}

object tiburon inherits Visual(image= "tiburon.png", position = new Position(x=9,y=1)) {
	const property puntos = 0 // para respetar polimorfismo???? o no es necesario?
	method nadar(destino) {
		position = game.at(
			position.x()+(destino.x()-position.x())/4,
			position.y()+(destino.y()-position.y())/4
		)
	}
	method comer(pez){
		game.say(self, "ATRODEN!")
	}
	
	method colisionadoPor(personaje) { 
		nivel.ubicarAleatoriamente(self)
		nivel.gameOver()
	}	
}

