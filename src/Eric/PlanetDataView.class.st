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
				         view radiusElement.

				         view massText }.



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

	^ BlElement new layout: BlFlowLayout new vertical
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

	view relocate: self radius - (0 / 2) @ (self radius / 2).
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
PlanetDataView >> radiusElement [

	^ self flowVertical
		  width: self radius;
		  constraintsDo: [ :c | 
			  c frame horizontal alignRight.
			  c frame vertical alignCenter ];
		  addChildren: { 
				  self radiusText.
				  self radiusLine.
				  self textElementFor: ' ' }
]

{ #category : #accessing }
PlanetDataView >> radiusLine [

	^ BlElement new
		  constraintsDo: [ :c | c flow float ];
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
