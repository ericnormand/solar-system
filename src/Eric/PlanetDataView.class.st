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

	| view pview rdisplay |
	view := self new
		        radius: 200;
		        planet: aPlanet.

	pview := BlElement new
		         layout: BlFrameLayout new;
		         size: view radius * 2 asPoint;
		         constraintsDo: [ :c | 
			         c frame vertical alignTop.
			         c frame horizontal alignCenter ];
		         addChildren: { 
				         view planetView.
				         (view radiusElement constraintsDo: [:c| c frame horizontal alignRight. c frame vertical alignCenter]).

				         (view massText constraintsDo: [ :c | 
						          c frame horizontal alignCenter.
						          c frame vertical alignBottom ]; padding: (BlInsets bottom: 30)) }.



	view
		layout: BlFrameLayout new;
		size: view radius * 2 @ (view radius * 2 + 20);
		addChildren: { 
				pview.
				view nameText }.


	^ view
]

{ #category : #accessing }
PlanetDataView >> flowVertical [

	^ BlElement new layout: BlLinearLayout vertical
]

{ #category : #accessing }
PlanetDataView >> frameHorizontal [

	^ BlElement new
		  layout: BlFrameLayout new;
		  constraintsDo: [ :c | c horizontal matchParent ]
]

{ #category : #accessing }
PlanetDataView >> massText [

	| view |
	view := self textElementFor: planet mass asString , ' earth masses'.


	^ view
]

{ #category : #accessing }
PlanetDataView >> nameText [

	| view |
	view := self textElementFor: planet name.
	view constraintsDo: [ :c | 
		c frame horizontal alignCenter.
		c frame vertical alignBottom ].
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
		  background: planet color clone;
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
PlanetDataView >> radiusElement [

	^ BlElement new
	size: self radius @ self radius;
	layout: BlFrameLayout new;
	addChildren: { 
			(BlAttributedTextElement new
				 text: (self planet radius asString , ' earth radii') asRopedText;
				 constraintsDo: [ :c | c frame horizontal alignCenter. c frame vertical alignCenter ];
				 padding: (BlInsets bottom: 30)).
			(BlElement new
				 background: Color black;
				 height: 2;
				 constraintsDo: [ :c | 
					 c horizontal matchParent.
					 c frame vertical alignCenter ]) }
]

{ #category : #accessing }
PlanetDataView >> radiusLine [

	^ BlElement new
		  size: self radius @ 4;
		  background: Color black
]

{ #category : #accessing }
PlanetDataView >> radiusText [

	| rtext |
	^ self frameHorizontal
		  constraintsDo: [ :c | c ];
		  addChildren: { (self textElement
				   text: (planet radius asString , ' earth radii') asRopedText;
				   constraintsDo: [ :c | c frame horizontal alignCenter ]) }
]

{ #category : #accessing }
PlanetDataView >> textElement [

	^ BlAttributedTextElement new text:
		  (planet radius asString , ' earth radii') asRopedText
]

{ #category : #accessing }
PlanetDataView >> textElementFor: aString [

	^ BlAttributedTextElement new text: aString asRopedText
]
