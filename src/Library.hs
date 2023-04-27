module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

type Nombre = String
type Antiguedad = Number
type Grado = Number
type Clan = String

data Hechicero = UnHechicero {
    nombre :: String,  
    antiguedad :: Number, 
    grado :: Number,
    clan :: String,
    rol :: String
}

nobara :: Hechicero
nobara = UnHechicero "Nobara" 1 3 "Kugisaki" "Estudiante"

satoru :: Hechicero
satoru = UnHechicero "Satoru" 15 0 "Gojo" "Profesor"

maki :: Hechicero
maki = UnHechicero "Maki" 3 4 "Zenin" "Estudiante"

yuji :: Hechicero 
yuji = UnHechicero "Yuji" 0 1 "Itadori" "Estudiante"


