'From Cuis 5.0 [latest update: #4024] on 21 February 2020 at 6:38:38 pm'!
'Description un logo experimental'!
!provides: 'AtaLogo' 1 2!
SystemOrganization addCategory: #AtaLogo!


!classDefinition: #TortugaTest category: #AtaLogo!
TestCase subclass: #TortugaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaLogo'!
!classDefinition: 'TortugaTest class' category: #AtaLogo!
TortugaTest class
	instanceVariableNames: ''!

!classDefinition: #Tortuga category: #AtaLogo!
Object subclass: #Tortuga
	instanceVariableNames: 'dir estilo rastro pos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaLogo'!
!classDefinition: 'Tortuga class' category: #AtaLogo!
Tortuga class
	instanceVariableNames: ''!


!TortugaTest commentStamp: '<historical>' prior: 0!
A forma de probar que a Tortuga fai o que debe!

!Tortuga commentStamp: '<historical>' prior: 0!
Soy una tortuga de Logo, me muevo por un plano dejando un rastro si quiero!

!TortugaTest methodsFor: 'testing' stamp: 'pd 2/21/2020 18:35:37'!
testMovement
	"comprobar o movemento da tartaruga"

	| t p | 
	t := Tortuga new.
	p := t posicion.
	self assert: ((t avanza: 10 ; distanciaDe: p) = 10).
	t dir: 0.
	self assert: ((t gira: 720) dir = 0).
	self assert: ((t gira: 23) dir = 23).
	t dir: 0.	
	self assert: ((t gira: -90) dir = 270) ! !

!TortugaTest methodsFor: 'testing' stamp: 'pd 2/21/2020 18:16:41'!
testObjectCreationValues
	"check object has three instance variables"
	| t |
       t := Tortuga new.
	self assert: (t valores size = 4).
	self assert: (t dejaRastro = false).
	self assert: (t posicion = (0@0)).
	self assert: (t dir = 45).
	! !

!Tortuga methodsFor: 'moving' stamp: 'pd 2/21/2020 17:17:59'!
avanza: aNumber
	"avanza un número de pasos"

	pos := (aNumber * dir degreeCos)@(aNumber * dir degreeSin).
! !

!Tortuga methodsFor: 'moving' stamp: 'pd 2/21/2020 17:58:39'!
conRastro
	"deja rastro"

	rastro := true.! !

!Tortuga methodsFor: 'moving' stamp: 'pd 2/21/2020 18:10:20'!
distanciaDe:  unPunto
	"distncia de la tortuga a un punto"

	| p |
	p := self posicion.
	^((unPunto x - p x) squared + (unPunto y - p y) squared ) sqrt
	! !

!Tortuga methodsFor: 'moving' stamp: 'pd 2/21/2020 18:37:09'!
gira: unNumero
	"giro unos grados sexagesimales en el sentido de las agujas del reloj si son negativos o al contrario si son positivos"

	dir := unNumero mod: 360. ! !

!Tortuga methodsFor: 'moving' stamp: 'pd 2/21/2020 17:58:49'!
sinRastro
	"no deja rastro"

	rastro := false.! !

!Tortuga methodsFor: 'initialization' stamp: 'pd 2/21/2020 17:59:39'!
initialize
	"valores por defecto para las variables"

	dir := 45. estilo := Color blue. rastro := false. pos := 0@0.! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:57:56'!
dejaRastro
	"indica si dejo o no rastro"

	^rastro! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:59:25'!
dir
	"ángulo de la dirección a la que miro"

	^dir! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:59:04'!
dir: aNumber
	"el ángulo de dirección en grados sexagesimales"

	
	dir := aNumber.! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:57:00'!
posicion
	"indico donde estoy"

	^pos! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:56:39'!
posicion: unPunto
	"establece la posicion como un punto del plano"

	pos:= unPunto.! !

!Tortuga methodsFor: 'accessing' stamp: 'pd 2/21/2020 17:56:00'!
valores
	"devuelve los valores de las variables de insancia en una lista"

	
	^Array with: dir with: estilo with: rastro with: pos! !
