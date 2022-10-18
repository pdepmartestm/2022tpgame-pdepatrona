import wollok.game.*
import visuales.*
import factories.*
import elementos.*

object nivel {
	
	const anchoTablero = 11
	const altoTablero = 5
	
	method inicio() {
		game.clear()
		game.title("Sheldon Eats")
		game.width(12)
	  	game.height(6)
	  	game.cellSize(120)
	  	game.addVisual(inicioDelJuego)
	  		  	
	  	keyboard.s().onPressDo{self.configurate()	
	  	}
	}
	
	method configurate() {
		game.clear()
 		game.addVisual(fondo)
		
  		//Visuales	
		game.addVisual(sheldon)
		movimiento.configurarFlechas(sheldon)
		
		new MarcoSolido(
				verticeInicial= game.origin(),
				verticeFinal = new Position(x=anchoTablero, y=altoTablero),
				image = "burbuja.png").dibujar()	    

		game.addVisual(tiburon)
		game.onTick(300, "nadar", {tiburon.nadar(sheldon.position())}) //el tiburon persigue a sheldon
		
		//Colisiones		
		game.whenCollideDo(sheldon, {elemento => elemento.colisionadoPor(sheldon) win.actualizarPuntos()})
		
		[globo,pez10,pez15,pez20,pez30, pulpo, abisal, medusa].forEach { x =>  
			game.addVisual(x)
			self.ubicarAleatoriamente(x)}
	}
		
	method ubicarAleatoriamente(visual){
		var posicion = new Position (x=1.randomUpTo(anchoTablero),y=1.randomUpTo(altoTablero))
		if(game.getObjectsIn(posicion).isEmpty())
			visual.position(posicion)
		else
			self.ubicarAleatoriamente(visual)			
			
		}
		
	method hasGanado(){
		game.clear()
		game.width(12)
		game.height(6)
		game.addVisual(ganaste)
		
		sheldon.puntos(0)
		movimiento.estado(normal)
		keyboard.r().onPressDo{self.configurate()}
	}
	
	method gameOver(){
		game.clear()
		game.width(12)
		game.height(6)
        game.addVisual(perdiste)
        
        sheldon.puntos(0)
        movimiento.estado(normal)
        nivel.ubicarAleatoriamente(tiburon) //muevo el tiburon de lugar porque sino aparezco en la misma posicion y pierdo inmediatamente
        
		keyboard.r().onPressDo{self.configurate()}
	}
	 
}