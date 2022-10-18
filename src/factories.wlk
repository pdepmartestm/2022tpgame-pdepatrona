import visuales.*
import elementos.*
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

/*CONFIGURACION DE TECLADO*/
object movimiento {
	var property estado = normal
	method configurarFlechas(visual){
		keyboard.up().onPressDo{ estado.mover(arriba,visual)}
		keyboard.down().onPressDo{ estado.mover(abajo,visual)}
		keyboard.left().onPressDo{ estado.mover(izquierda,visual) sheldon.image("sheldonTrosco.png")} //Sheldon que mira a la izquierda
		keyboard.right().onPressDo{ estado.mover(derecha,visual) sheldon.image("sheldon.png")}
   }
}

object normal{	
	method mover(direccion,personaje){
		personaje.position(direccion.siguiente(personaje.position()))
	}
}

object electrocutado{	
	method mover(direccion,personaje){
	}
}

class VisualSolido inherits Visual{
	
	var property direccionRebote 
	
	method colisionadoPor(elemento) {
		movimiento.estado().mover(direccionRebote,elemento)
	}
}		
		
//direcciones
object izquierda { 
	method siguiente(position) = position.left(1) 
}

object derecha { 
	method siguiente(position) = position.right(1) 
}

object abajo { 
	method siguiente(position) = position.down(1) 
}

object arriba { 
	method siguiente(position) = position.up(1) 
}