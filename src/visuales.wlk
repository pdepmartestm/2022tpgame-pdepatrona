import factories.*
import nivel.*

import wollok.game.*


class Visual {
	var property image
	var property position = game.origin()
}

object sheldon inherits Visual(image = "sheldon.png",position = new Position(x=1,y=1)){

	var property puntos = 0

	method sumaPuntos(cantidad) { puntos += cantidad }

	method comer(pez){
		self.sumaPuntos(pez.puntos())
		game.say(self, "Tengo " + self.puntos() + " puntos!!")
		
	}

}

const inicioDelJuego = new Visual( image =  "pantallaInicio.png", position = game.origin())
const ganaste = new Visual( image = "pantallaGanaste.png", position = game.origin())
const perdiste = new Visual(image = "pantallaGameOver.png", position = game.origin())


object fondo inherits Visual(
	image = "fondo.png",
	position = game.origin()
){
	method colisionadoPor(visual){}
}

object win{
	
	method actualizarScoreTotal(){
		if (sheldon.puntos() >= 150) {
			nivel.hasGanado()
		}
	}
	

}