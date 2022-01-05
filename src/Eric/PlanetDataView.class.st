Class {
	#name : #PlanetDataView,
	#superclass : #BlElement,
	#instVars : [
		'radius',
		'planet'
	],
	#category : #Eric
}

{ #category : #accessing }
PlanetDataView class >> newWith: aPlanet [

	| view |
	view := self new
		        radius: 200;
		        planet: aPlanet.

	view
		layout: BlFrameLayout new;
		size: view radius asPoint * 2;
		addChild: view planetView;
		addChild: view radiusLine;
		addChild: view radiusText;
		addChild: view nameText;
		addChild: view massText.

	^ view
]

{ #category : #accessing }
PlanetDataView >> massText [

	| view |
	view := BlAttributedTextElement new text:
		        (planet mass asString , ' earth masses') asRopedText.

	view relocate: self radius - (0 / 2) @ (self radius / 2).
	^ view
]

{ #category : #accessing }
PlanetDataView >> nameText [

	| view |
	view := BlAttributedTextElement new text:
		        planet name asString asRopedText.
	view constraintsDo: [ :c | 
		c frame horizontal alignCenter.
		c frame vertical alignBottom ].
	"view relocate: self radius - (view extent x / 2) @ (self radius * 2 + 10)."
	^ view
]

{ #category : #accessing }
PlanetDataView >> planet [

	^ planet
]

{ #category : #accessing }
PlanetDataView >> planet: aPlanet [

	planet := aPlanet
]

{ #category : #accessing }
PlanetDataView >> planetView [

	^ BlElement new
		  geometry: BlEllipseGeometry new;
		  background: planet background clone;
		  size: self radius * 2 @ (self radius * 2);
		  yourself
]

{ #category : #accessing }
PlanetDataView >> radius [

	^ radius
]

{ #category : #accessing }
PlanetDataView >> radius: anInteger [ 
  radius:=anInteger
]

{ #category : #accessing }
PlanetDataView >> radiusLine [

	^ BlElement new
		  size: self radius @ 4;
		  background: Color black;
		  relocate: self radius @ (self radius - 2)
]

{ #category : #accessing }
PlanetDataView >> radiusText [

	| rtext |
	rtext := BlAttributedTextElement new text:
		         (planet radius asString , ' earth radii') asRopedText.
	rtext transformDo: [ :aTransform | 
		aTransform translateBy:
			self radius + (self radius / 2) - (rtext extent x / 2)
			@ (self radius - 16) ].
	^ rtext
]
