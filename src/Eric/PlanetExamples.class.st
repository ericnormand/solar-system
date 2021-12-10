Class {
	#name : #PlanetExamples,
	#superclass : #Object,
	#category : #Eric
}

{ #category : #accessing }
PlanetExamples >> newMethod [
	"This is a new method"
]

{ #category : #accessing }
PlanetExamples >> planetWithoutCenter [

	<gtExample>
	| p |
	p := Planet new.

	self assert: p centerDist2 = 0.

	^ p
]
