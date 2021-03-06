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

* When you can't make so many changes, aim to expose dependencies rather than conceal them

* Using wrappers (Ruby modules) to protect from changes, 'factories'

* Dependencies and direction: how to choose direction

* "Depend on things that change less often than you do"

* Unpacking that statement, we have that some classes are more likely to change than others (in requirements), concrete classes are more likely to change than abstract classes, changing a class with many dependents might result in many widespread consequences

* "Dependency management is core to creating future-proof applications."

Chapter 4

* How do we create flexible interfaces? What is an interface?

* Visualizing communication patterns as a network of nodes and connections

* Exposed methods are a class's public interface

* Kitchens, kitchen windows, and interfaces

* "The kitchen does many things but does not, thankfully, expose them all to its customers."

* "Using a menu avoids this problem by letting each customer ask for what they want without knowing anything about how the kitchen makes it."

* Public interfaces: reveal primary responsibility, are invoked by others, won't change much, are safe for others to depend on, are thoroughly documented in tests

* Private interfaces: handle implementation details, shouldn't be sent by other objects, can change for any reason, are unsafe for others to depend on, might not be referenced in tests

* Using UML: Unified Modeling Language

* Simple sequence diagrams, deciding who gets what responsibility, asking for 'what' instead of telling 'how'

* Demeter rule: only talk to your immediate neighbors ('only use one dot when calling methods' or 'avoid train wrecks')

* "Focusing on messages reveals objects that might otherwise be overlooked. When messages are trusting and ask for what the sender wants instead of telling the receiver how to behave, objects naturally evolve public interfaces that are flexible and reusable in novel and unexpected ways."

Chapter 5

* "Duck types are public interfaces that are not tied to any specific class. These across-class interfaces add enormous flexibility to your application by replacing costly dependencies on class with more forgiving dependencies on messages."

* Name comes from the phrase 'if it walks like a duck, talks like a duck...' - i.e. defined by behavior

* "However, you are not limited to expecting an object to respond to just one interface [...] it can implement many different interfaces."

* "Trip's prepare method firmly believes that its argument contains a preparer of bicycles."

* "...this dependent-laden code is a natural outgrowth of a class-based perspective."

* Don't introduce new dependencies unnecessarily!

* [basically, make generic class requests instead of hard-coding requests for specific classes]

* polymorphism in OOP: "ability of many different objects to respond to the same message"

* this can be achieved through duck typing, as well as inheritance/behavior sharing

Chapter 6

* well-designed code is reusable

* classical inheritance and other kinds of inheritance

* inheritance is "a mechanism for automatic message delegation"

* subclasses and superclasses: messages are forwarded from subclass to superclass

* "Inheritance provides a way to define two objects as having a relationship such that when the first receives a message that it does not understand, it automatically forwards, or delegates, the message to the second."

* You can use UML sequence diagrams to illustrate class relationships

* "The Bicycle class contains behavior that is appropriate for both a peer and a parent of MountainBike."

* Abstract classes and subclasses: abstract classes should not be instantiated, only subclassed

* deciding between refactoring strategies: what happens if you are wrong?

* "Any class that uses the template method pattern must supply an implementation for every message it sends, even if the only reasonable implementation in the sending class looks like this... [NotImplementedError]"

* common error: forgetting to send super

* "When a subclass sends super, it's effectively declaring that it knows the algorithm; it depends on this knowledge. If the algorithm changes, then the subclasses may break even if their own specializations are not otherwise affected."

* "When your problem is one of needing numerous specializations of a stable, common abstraction, inheritance can be an extremely low-cost solution."

Chapter 7

* "Sharing Role Behavior with Modules"

* "When an object includes a module, the methods defined therein become available via automatic delegation."

* objects can respond to many messages: including those it implements directly, those in parent objects, those in its modules, and those in modules of parents

* "Understanding the similarities between classical inheritance and module inclusion is easier if you understand how object-oriented languages, in general, and Ruby, in particular, find the method implementation that matches a message send."

* method lookup: from most to least specific (up the chain)

* 'extend' keyword vs 'include' keyword

* Liskov substitition: "in order for a type system to be sane, subtypes must be substitutable for their supertypes"

* shallow hierarchies (predictable dependencies)

* "When objects that play a common role need to share behavior, they do so via a Ruby module. The code defined in a module can be added to any object, be it an instance of a class, a class itself, or another module."

Chapter 8

* "Combining Objects with Composition"

* composition vs inheritance

* using a factory

* aggregation as a special kind of composition

* "The university-department relationship is one of composition (in its strictest sense) and the department-professor relationship is aggregation. Destroying a department does not destroy its professors; they have an existence and life of their own."

* how to arrange code - inheritance or composition?

* "The general rule is that, faced with a problem that composition can solve, you should be biased toward doing so."

* why? generally fewer dependencies

* "At its best, composition results in applications built of simple, pluggable objects that are easy to extend and have a high tolerance for change."

* choosing relationships: use inheritance for is-a relationships, use duck types for behaves-like-a relationships, use composition for has-a relationships

Chapter 9

* Refactoring is changing the internal structure of code in a way that does not affect the external behavior.

* why test? to find bugs, to help document code, to defer design decisions, supporting abstractions, exposing design flaws

* "Your overall goal is to create well-designed applications that have acceptable test coverage."

* BDD and TDD

* using MiniTest...

* mocks: mocks are tests of behavior, rather than tests of state

* Summary

* "Tests are indispensable. Well-designed applications are highly abstract and under constant pressure to evolve; without tests these applications can be neither understood nor safely changed. The best tests are loosely coupled to the underlying code and test everything once and in the proper place. They add value without increasing costs."

* "A well-designed application with a carefully crafted test suite is a joy to behold and a pleasure to extend. It can adapt to every new circumstance and meet and unexpected need."
