Class {
	#name : #BaselineOfEric,
	#superclass : #BaselineOf,
	#category : #BaselineOfEric
}

{ #category : #accessing }
BaselineOfEric >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Eric']
]
