import visuales.*
import wollok.game.*

class MarcoSolido {
	const verticeInicial
	const verticeFinal
	const image
	
	method dibujar() {
		self.dibujarLineaVertical(verticeInicial.x(),verticeInicial.y(),verticeFinal.y(),derecha)
		self.dibujarLineaVertical(verticeFinal.x(),verticeInicial.y(),verticeFinal.y(),izquierda)
		self.dibujarLineaHorizontal(verticeInicial.y(),verticeInicial.x()+1,verticeFinal.x()-1,arriba)
		self.dibujarLineaHorizontal(verticeFinal.y(),verticeInicial.x()+1,verticeFinal.x()-1,abajo)

	}
	method dibujarElemento(columna,fila,direccion) {
		const elemento = new VisualSolido(
			image = image, 
			position = new Position(x=columna,y=fila), 
			direccionRebote = direccion
		)
		game.addVisual(elemento)
	}
	method dibujarLineaVertical(columna,filaDesde,filaHasta,direccion){
		(filaDesde..filaHasta).forEach{fila=>self.dibujarElemento(columna,fila,direccion)}
	}
	method dibujarLineaHorizontal(fila,columnaDesde,columnaHasta,direccion){
		(columnaDesde..columnaHasta).forEach{columna=>self.dibujarElemento(columna,fila,direccion)}
	}
	

}
object movimiento {
	
	method configurarFlechas(visual){
		keyboard.up().onPressDo{ self.mover(arriba,visual)}
		keyboard.down().onPressDo{ self.mover(abajo,visual)}
		keyboard.left().onPressDo{ self.mover(izquierda,visual)}
		keyboard.right().onPressDo{ self.mover(derecha,visual)}
   }
	
	method mover(direccion,personaje){
		personaje.position(direccion.siguiente(personaje.position()))
	}	
	
	method configurarFlechasElectrocutado(visual){
		/* SE PUEDE RESOLVER MAS FACIL PONIENDO UNA VARIABLE GLOBAL LLAMADA DIRECCIONAMIENTO. CUANDO VALE 1 LAS FLECHAS VAN EN SENTIDO.
		 * ESTA FUNCION SOLO DEBERIA CAMBIAR EL VALOR POR -1 EN LOS OBJECT DERECHA IZQUIERDA, ARRIBA, ABAJO
		 */
		keyboard.up().onPressDo{ self.mover(abajo,visual)}
		keyboard.down().onPressDo{ self.mover(arriba,visual)}
		keyboard.left().onPressDo{ self.mover(derecha,visual)}
		keyboard.right().onPressDo{ self.mover(izquierda,visual)}
   }
	
}

class VisualSolido inherits Visual{
	
	var property direccionRebote 
	
	method colisionadoPor(elemento) {
		movimiento.mover(direccionRebote,elemento)
	}
}		
		

object izquierda { 
	method siguiente(position) = position.left(1) 
	method opuesto() = derecha
}

object derecha { 
	method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
}

object abajo { 
	method siguiente(position) = position.down(1) 
	method opuesto() = arriba
}

object arriba { 
	method siguiente(position) = position.up(1) 
	method opuesto() = abajo
}