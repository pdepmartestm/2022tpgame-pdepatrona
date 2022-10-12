import wollok.game.*
import visuales.*
import factories.*
import elementos.*
import score.*

object nivel {
	
	const anchoTablero = 11
	const altoTablero = 5
	
	method inicio() {
		game.clear()
		game.title("Sheldon Eats")
		game.width(12)
	  	game.height(6)
	  	game.cellSize(120)
	  	//game.boardGround("fondo.png")
	  	game.addVisual(inicioDelJuego)
	  	keyboard.s().onPressDo{self.configurate()}
	  	
	}
	
	method configurate() {
		game.clear()
 		game.addVisual(fondo)
 		
  		//Visuales	
		game.addVisual(sheldon)
		
		movimiento.configurarFlechas(sheldon)
		
		new MarcoSolido(
				verticeInicial= new Position(x=0,y=0),
				verticeFinal = new Position(x=anchoTablero, y=altoTablero),
				image = "burbuja.png").dibujar()	    

		game.addVisual(pulpo)
		game.addVisual(abisal)
		game.addVisual(medusa)
		game.addVisual(tiburon)
		game.onTick(300, "nadar", {tiburon.nadar()})
		
		
		//Colisiones		
		game.whenCollideDo(sheldon, {elemento => elemento.colisionadoPor(sheldon) win.actualizarScoreTotal()})
		game.whenCollideDo(tiburon, {elemento => elemento.colisionadoPor(tiburon) win.actualizarScoreTotal()})
		
		
		
		[globo,pez10,pez15,pez20].forEach { pez =>  
			game.addVisual(pez)
			self.ubicarAleatoriamente(pez) 
		}
		//score.dibujar()
		}
		
	method ubicarAleatoriamente(visual){
		var posicion = new Position (x=1.randomUpTo(anchoTablero),y=1.randomUpTo(altoTablero))
		if(game.getObjectsIn(posicion).isEmpty())
			visual.position(posicion)
		else
			self.ubicarAleatoriamente(visual)			
			
		}
		
	
	
	/*
	method hasGanado(){
		game.clear()
		game.width(anchoTotal)
		game.height(altoTotal)
		game.addVisual(winVisual)
		game.addVisual(empleadoDelMes)

		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
	}
	
	method gameOver(){
		game.clear()
		game.title("Bob Esponja y las Kangreburgers")
		game.width(anchoTotal)
		game.height(altoTotal)
        game.addVisual(gameOver)
		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
		
	}
	 */
}