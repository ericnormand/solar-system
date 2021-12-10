Class {
	#name : #Planet,
	#superclass : #BlElement,
	#instVars : [
		'mass',
		'center'
	],
	#category : #Eric
}

{ #category : #accessing }
Planet class >> G [
  ^ 0.0000000000667
]

{ #category : #accessing }
Planet class >> demo [
	"This is a new method"
	| sun |
	sun := self new.
	^sun
]

{ #category : #accessing }
Planet >> acceleration [
	"This is a new method"
	^ self forceSum / self mass
]

{ #category : #accessing }
Planet >> center [
  ^ center
]

{ #category : #accessing }
Planet >> center: aPlanet [
	"This is a new method"
	center := aPlanet
]

{ #category : #accessing }
Planet >> centerDist2 [

	| pos cpos |
	pos := self position.

	^ self center isNil
		  ifTrue: [ 0 ]
		  ifFalse: [ 
			  cpos := self center position.
			  (cpos x - pos x raisedTo: 2) + (cpos y - pos y raisedTo: 2) ]
]

{ #category : #accessing }
Planet >> color: aColor [
	"This is a new method"
	self background: aColor
]

{ #category : #accessing }
Planet >> forceDueToGravity [
  ^ self class G * self mass * self center mass / self centerDist2
]

{ #category : #accessing }
Planet >> forceSum [
  ^ self forceDueToGravity
]

{ #category : #accessing }
Planet >> initialize [
	"This is a new method"
	super initialize.
	self geometry: BlEllipseGeometry new;
	     color: (Color random);
	     
	     size: 10@10
]

{ #category : #accessing }
Planet >> mass [
]

{ #category : #accessing }
Planet >> mass: aMassInEarths [
	"This is a new method"
	mass := aMassInEarths
]

{ #category : #accessing }
Planet >> radius: aRadiusPx [
	"This is a new method"
	self size: (aRadiusPx asPoint)
]
