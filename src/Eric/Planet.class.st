Class {
	#name : #Planet,
	#superclass : #BlElement,
	#instVars : [
		'radius',
		'mass',
		'name',
		'revolvesAround'
	],
	#category : #Eric
}

{ #category : #accessing }
Planet >> gtPlanetDataFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Planet Data' translated;
		priority: 1;
		items: [ Array with: 'Mass' with: 'Radius'];
		column: 'Property' 
			text: [ :anElement :anIndex | 
				anElement ];
		column: 'Value' 
			text: [ :anElement :anIndex | 
				self perform: (anElement asLowercase asSymbol)]
]

{ #category : #accessing }
Planet >> gtPlanetViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Planet' translated;
		priority: 0;
		stencil: [self viewForPlanetData]
]

{ #category : #accessing }
Planet >> initialize [

	super initialize.
	self
		geometry: BlEllipseGeometry new;
		size: 20 @ 20;
		mass: 1;
		radius: 1;
		background: Color black.
]

{ #category : #accessing }
Planet >> mass [
	^ mass
]

{ #category : #accessing }
Planet >> mass: anInteger [ 
  mass := anInteger
]

{ #category : #accessing }
Planet >> name: aString [ 
name:= aString

]

{ #category : #accessing }
Planet >> radius [
	^ radius
]

{ #category : #accessing }
Planet >> radius: anInteger [ 
  radius := anInteger
]

{ #category : #accessing }
Planet >> radiusLine [
]

{ #category : #accessing }
Planet >> revolvesAround: aPlanet [
revolvesAround := aPlanet
]

{ #category : #accessing }
Planet >> viewForPlanetData [

	^PlanetDataView newWith: self
]
