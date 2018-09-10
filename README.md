## Practical Object-Oriented Design in Ruby
###### by Sandi Metz

#### Notes

Introduction

* "this book assumes that you have at least tried to write object-oriented software"

* general principles of OOP explained through Ruby examples

Chapter 1

* "the world is procedural... the world is also object-oriented"

* "This book is about designing object-oriented software, and how it views the world as a series of spontaneous interactions between objects."

* "Object-oriented design is about managing dependencies."

* SOLID: Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, Dependency Inversion

* Use patterns, but at the appropriate time

* Agile and Big Up Front Design (BUFD)

* "Agile works because it acknowledges that certainty is unattainable in advance of the application's existence"

* "Object-oriented applications are made up of objects and the messages that pass between them."

Chapter 2

* TRUE: Transparent, Reasonable, Usable, Exemplary

* Single Responsibility principle

* RDD: Responsibility-Driven Design

* "For better or for worse, the patterns you establish today will be replicated forever."

* obscuring references vs revealing references

* "The path to changeable and maintainable object-oriented software begins with classes that have a single responsibility. Classes that do one thing isolate that thing from the rest of your application. This isolation allows change without consequence and reuse without duplication."

Chapter 3

* "An object depends on another object if, when one object changes, the other might be forced to change in turn."

* Recognizing Dependencies

* An object has a dependency when it knows: the name of another class (Gear expects a class named Wheel to exist), the name of a message that it intends to send to someone other than self (Gear expects a Wheel instance to respond to diameter), the arguments that a message requires (Gear knows that Wheel.new requires a rim and a tire), the order of those arguments (Gear knows that Wheel takes positional arguments and that the first should be rim, the second, tire).

* Each coupling creates a dependency; linked objects act (and are tested) as one

* [decoupling: named references vs direct references] - aka 'dependency injection'

* "Gear is now smarter because it knows less."
