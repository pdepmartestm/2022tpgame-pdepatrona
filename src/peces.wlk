import wollok.game.*

object pez10R {
    var property position = game.at(3,2)

    method image() = "pez10R.png"

    method puntos() = 10
}

object pez10A {
    var property position = game.at(4,3)

    method image() = "pez10V.png"

    method puntos() = 10
}

object pez10V {
    var property position = game.at(5,3)

    method image() = "pez10A.png"

    method puntos() = 10
}

object pez10R1 {
    var property position = game.at(7,2)

    method image() = "pez10R.png"

    method puntos() = 10
}

object pez10A1 {
    var property position = game.at(8,3)

    method image() = "pez10V.png"

    method puntos() = 10
}

object pez10V1 {
    var property position = game.at(9,3)

    method image() = "pez10A.png"

    method puntos() = 10
}

//Peces de 15 Puntos
object pez15A {
    var property position = game.at(5,4)

    method image() = "pez15A.png"

    method puntos() = 15
}

object pez15C {
    var property position = game.at(7,3)

    method image() = "pez15C.png"

    method puntos() = 15
}

object pez15N {
    var property position = game.at(8,4)

    method image() = "pez15N.png"

    method puntos() = 15
}

object pez15A1 {
    var property position = game.at(9,4)

    method image() = "pez15A.png"

    method puntos() = 15
}

//peces de 20 puntos
object pez20A {
    var property position = game.at(4,1)

    method image() = "pez20A.png"

    method puntos() = 20
}

object pez20N {
    var property position = game.at(6,2)

    method image() = "pez20N.png"

    method puntos() = 20
}

object pez20V {
    var property position = game.at(10,3)

    method image() = "pez20V.png"

    method puntos() = 20
}

//Peces de 30 puntos
object pez30 {
    var property position = game.at(3,4)

    method image() = "pez30.png"

    method puntos() = 15
}

object pez301 {
    var property position = game.at(6,1)

    method image() = "pez30.png"

    method puntos() = 15
}

object pez302 {
    var property position = game.at(9,1)

    method image() = "pez30.png"

    method puntos() = 15
}

object pez303 {
    var property position = game.at(10,1)

    method image() = "pez30.png"

    method puntos() = 15
}

//Pulpos
object pulpo {
    var property position = game.at(3,3)

    method image() = "pulpo.png"
    
    method puntos() = 35
    
    //method tinta()
}

object pulpo1{
    var property position = game.at(6,3)

    method image() = "pulpo.png"
    
    method puntos() = 35
    
    //method tinta()
}

object pulpo2{
    var property position = game.at(9,2)

    method image() = "pulpo.png"
    
    method puntos() = 35
    
    //method tinta()
}

//MALOS
object globoC {
    var property position = game.at(4,2)

    method image() = "globoC.png"

    method puntos() = -10
}

object globoM {
    var property position = game.at(7,4)

    method image() = "globoM.png"

    method puntos() = -10
}

object globoV {
    var property position = game.at(8,1)

    method image() = "globoV.png"

    method puntos() = -10
}

object globoC1 {
    var property position = game.at(10,2)

    method image() = "globoC.png"

    method puntos() = -10
}

//medusas
object medusa {
    var property position = game.at(5,1)

    method image() = "medusa.png"

    method puntos() = -15
}

object medusa1 {
    var property position = game.at(6,4)

    method image() = "medusa.png"

    method puntos() = -15
}

object medusa2 {
    var property position = game.at(8,2)

    method image() = "medusa.png"

    method puntos() = -15
}

object medusa3 {
    var property position = game.at(10,4)

    method image() = "medusa.png"

    method puntos() = -15
}

object abisal {
    var property position = game.at(3,1)

    method image() = "abisal.png"

    method puntos() = -20
}

object tiburon {
    var property position = game.at(4,4)

    method image() = "tiburon.png"

    method puntos() = -1000
}

object tiburon1 {
    var property position = game.at(5,2)

    method image() = "tiburon.png"

    method puntos() = -1000
}
object tiburon2 {
    var property position = game.at(7,1)

    method image() = "tiburon.png"

    method puntos() = -1000
}
