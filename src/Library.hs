module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

-- Punto 1

type Nombre = String
type Antiguedad = Number
type Grado = Number
type Clan = String

data Hechicero = UnHechicero {
   -- nombre :: Nombre,  No lo usamos, podemos no tenerlo
    antiguedad :: Antiguedad, 
    grado :: Grado,
    clan :: Clan
} deriving Show

nobara :: Hechicero
nobara = UnHechicero 1 3 "Kugisaki" 

satoru :: Hechicero
satoru = UnHechicero 15 0 "Gojo"

maki :: Hechicero
maki = UnHechicero 3 4 "Zenin" 

yuji :: Hechicero 
yuji = UnHechicero 0 1 "Itadori" 


--Punto 2

tieneExperiencia :: Hechicero -> Bool
tieneExperiencia hechicero = antiguedad hechicero > 1

-- Punto 3

type Equipo = [Hechicero]

grupo :: Equipo
grupo = [nobara, yuji, satoru, maki]

estaPreparado :: Equipo -> Bool
estaPreparado equipo = length equipo > 3

-- Punto 4

subirGrado :: Hechicero -> Hechicero
subirGrado hechicero | gradoEspecial hechicero = hechicero  
                     | otherwise = hechicero {grado = grado hechicero - 1 }

gradoEspecial :: Hechicero -> Bool
gradoEspecial hechicero = grado hechicero == 0

-- Punto 5

esPrestigioso :: Hechicero -> Bool
esPrestigioso hechicero = elem (clan hechicero) clanesPrestigiosos

clanesPrestigiosos = ["Zenin", "Kamo", "Gojo"]

--SEGUNDA PARTE

invencibles :: Equipo -> Bool
invencibles equipo = any gradoEspecial equipo

esFavorito :: Equipo -> Bool
esFavorito equipo = all esPrestigioso equipo

type Expertos = [Hechicero]

expertos :: Equipo -> Expertos
expertos equipo = filter tieneExperiencia equipo 

powerUp :: Equipo -> Equipo
powerUp equipo = map subirGrado equipo

-- Punto 10

elMasApto :: Ord a => (Hechicero -> a) -> Hechicero -> Hechicero -> Hechicero
elMasApto nivel hechicero1 hechicero2 
    | nivel hechicero1 > nivel hechicero2 = hechicero1
    | otherwise = hechicero2


nivelTryhard :: Hechicero -> Number
nivelTryhard hechicero = 1 / (grado hechicero + 1)

nivelBurocratico :: Hechicero -> Number
nivelBurocratico hechicero = length (clan hechicero)

nivelIntimidante :: Hechicero -> Char
nivelIntimidante hechicero = maximum (clan hechicero) --maximum es una función que elige el mayor en una lista, ver guía de lenguajes

nivelSigilio :: Hechicero -> Number
nivelSigilio hechicero = antiguedad hechicero * 6