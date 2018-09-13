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

* Recognising Dependencies

* An object has a dependency when it knows: the name of another class (Gear expects a class named Wheel to exist), the name of a message that it intends to send to someone other than self (Gear expects a Wheel instance to respond to diameter), the arguments that a message requires (Gear knows that Wheel.new requires a rim and a tire), the order of those arguments (Gear knows that Wheel takes positional arguments and that the first should be rim, the second, tire).

* Each coupling creates a dependency; linked objects act (and are tested) as one

* [decoupling: named references vs direct references] - aka 'dependency injection'

* "Gear is now smarter because it knows less."

* When you can't make so many changes, aim to expose dependencies rather than conceal them

* Using wrappers (Ruby modules) to protect from changes, 'factories'

* Dependencies and direction: how to choose direction

* "Depend on things that change less often than you do"

* Unpacking that statement, we have that some classes are more likely to change than others (in requirements), concrete classes are more likely to change than abstract classes, changing a class with many dependents might result in many widespread consequences

* "Dependency management is core to creating future-proof applications."

Chapter 4

* How do we create flexible interfaces? What is an interface?

* Visualising communication patterns as a network of nodes and connections

* Exposed methods are a class's public interface

* Kitchens, kitchen windows, and interfaces

* "The kitchen does many things but does not, thankfully, expose them all to its customers."

* "Using a menu avoids this problem by letting each customer ask for what they want without knowing anything about how the kitchen makes it."

* Public interfaces: reveal primary responsibility, are invoked by others, won't change much, are safe for others to depend on, are thoroughly documented in tests

* Private interfaces: handle implementation details, shouldn't be sent by other objects, can change for any reason, are unsafe for others to depend on, might not be referenced in tests

* Using UML: Unified Modelling Language

* Simple sequence diagrams, deciding who gets what responsibility, asking for 'what' instead of telling 'how'

* Demeter rule: only talk to your immediate neighbours ('only use one dot when calling methods' or 'avoid train wrecks')

* "Focusing on messages reveals objects that might otherwise be overlooked. When messages are trusting and ask for what the sender wants instead of telling the receiver how to behave, objects naturally evolve public interfaces that are flexible and reusable in novel and unexpected ways."

Chapter 5

* "Duck types are public interfaces that are not tied to any specific class. These across-class interfaces add enormous flexibility to your application by replacing costly dependencies on class with more forgiving dependencies on messages."

* Name comes from the phrase 'if it walks like a duck, talks like a duck...' - i.e. defined by behaviour

* "However, you are not limited to expecting an object to respond to just one interface [...] it can implement many different interfaces."

* "Trip's prepare method firmly believes that its argument contains a preparer of bicycles."

* "...this dependent-laden code is a natural outgrowth of a class-based perspective."

* Don't introduce new dependencies unnecessarily!

* [basically, make generic class requests instead of hard-coding requests for specific classes]

* polymorphism in OOP: "ability of many different objects to respond to the same message"

* this can be achieved through duck typing, as well as inheritance/behaviour sharing

Chapter 6

* well-designed code is reusable

* classical inheritance and other kinds of inheritance

* inheritance is "a mechanism for automatic message delegation"

* subclasses and superclasses: messages are forwarded from subclass to superclass

* "Inheritance provides a way to define two objects as having a relationship such that when the first receives a message that it does not understand, it automatically forwards, or delegates, the message to the second."

* You can use UML sequence diagrams to illustrate class relationships

* "The Bicycle class contains behaviour that is appropriate for both a peer and a parent of MountainBike."

* Abstract classes and subclasses: abstract classes should not be instantiated, only subclassed
