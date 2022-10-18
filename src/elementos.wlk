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

class PecesMalos inherits Visual {
	const property puntos
	method colisionadoPor(personaje)
	{
		personaje.comer(self)
	}
}

object pulpo inherits PecesMalos(image= "pulpo.png",puntos=35) {
	override method colisionadoPor(personaje){ 
		super(personaje)
		game.removeVisual(self)
 		game.addVisual(tinta) 		 		
	}
}

object abisal inherits PecesMalos(image= "abisal.png", puntos = -35) { //COMO HAGO PARA QUE LA PRIMERA POSICION SEA AL AZAR???
	override method colisionadoPor(personaje){ 
		super(personaje)
		game.addVisual(pantallaOscura)
		game.sound("cortasteTodaLaLoz.mp3").play()
		
		nivel.ubicarAleatoriamente(self)
		game.schedule(4000, { game.removeVisual(pantallaOscura) })
	}
}

object medusa inherits PecesMalos(image= "medusa.png", puntos = -15) {
	override method colisionadoPor(personaje) { 
		super(personaje)
		sheldon.image("sheldonSacaLaManoDeAhiCarajo.png") //https://www.youtube.com/watch?v=6UlasOF_ee0 
		game.sound("sacaLaManoDeAhi.mp3").play()
		
		movimiento.estado(electrocutado)
		nivel.ubicarAleatoriamente(self)
		game.schedule(4000, { sheldon.image("sheldon.png") movimiento.estado(normal)})
	}
}

object tiburon inherits Visual(image= "tiburon.png", position = new Position(x=9,y=1)) {

	method nadar(destino) {
		position = game.at(
			position.x()+(destino.x()-position.x())/4,
			position.y()+(destino.y()-position.y())/4
		)
	}

	method colisionadoPor(personaje) { 
		nivel.ubicarAleatoriamente(self)
		game.sound("comido.mp3").play()
		
		nivel.gameOver()
	}	
}

