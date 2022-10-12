import wollok.game.*
import visuales.*
import factories.*
import elementos.*

object score{
	const elementos = [globo,pez10,pez15,pez20]
	const posicionInicial = new Position(x=8,y=4)
	
	method dibujar(){
		var n = 0
		elementos.forEach{ elem=>self.dibujarItem(elem, posicionInicial.down(n))
			n+=1
		}
	}
	method dibujarItem(elemento,posicion){
		game.addVisual(new Visual(image = elemento.image(),position = posicion))
	}

}

