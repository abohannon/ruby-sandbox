# Object Oriented Programming

## Classes and Methods

What is an implicit return?

- In Ruby, the last line of a function is returned without the need for a `return` keyword.

What is a class?

- A class is a blueprint for an object. Classes are a way to encapsulate data and logic in an organized and reproducible manner.

When should you use a class?

- You should create a class whenever you have a coherent set of data and logic that should be co-located. Also if you need multiple instances of this data and logic. (e.g. a Viking class can create an army of vikings. Or you could create a state object to hold application state and create a new state object every time the state changes.)
- Classes are useful to use when you want to give methods to your data or have multiple instances of your data.

How do you create a class in your script file?

- To create a class you first declare the `class` keyword, then the name of the class in **CamelCase**. The filename should be the same name as the class, but in **snake_case**.

What is an instance of a class?

- An instance of a class is an object created by calling `::new` on a class. It is created with all the class's instance methods and instance variables.

What is the difference between the Pascal Case and snake_case styles of naming?

- Well, PascalCase looks like this. And snake_case looks like this. The former is used for class names. The latter for file and method names.

How do you instantiate a class?

- To instantiate a class you call `::new` on the class with any arguments the class requires.

How do you set the state of your new instance?

- By passing arguments to `::new` which are then passed to `::initialize`.

What should be done in the #initialize method?

- You should setup your object's state by initializing instance variables

```
class Viking
    def initialize(name, age, health, strength)
        @name = name
        @age = age
        @health = health
        @strength = strength
    end
end

> oleg = Viking.new("Oleg", 19, 100, 8)
```

What is a class method?

- A method that can only be called by the class itself
- Declared with `self.method_name`.

How is a class method different from an instance method?

- A class method can only be called by the class itself and not the instance of the class

How are methods you already know like #count or #sort etc instance methods?

- They are called on the instance of an array

What’s the difference between how you declare a class method vs an instance method?

- Class methods are declared with `self.method_name`.
- Instance methods are declared like normal methods.

What’s the difference between how you call a class method vs an instance method?

- `Class.class_method_name` (good)
- `Class.instance_method_name` (bad)
- `instance_of_class.instance_method_name` (good)
- `instance_of_class.class_method_name` (bad)

What is an instance variable?

- A variable declared with an `@` eg. `@name`
- It has scope throught one instance of a class.

What’s the difference between an instance variable and a ‘regular’ variable?

- A regular variable has scope only within the current context.
- An instance variable has scope throughout one instance of a class.

What are “getter” and “setter” methods used for?

What is the difference between a “getter” and a “setter” method?

- A getter gets a variable's value
- A setter sets a variable's value

```
def name
  @name
end

def name=(name)
  @name = name
end
```

How do you make instance variables readable outside your class? Writeable? Both at the same time?

- `attr_reader`
- `attr_writer`
- `attr_accessor`

Can a class call its own class methods?

- Class methods can only be called on the class, not the instance.

What’s the difference between when you would use a class variable and when you would use a constant?

- Constants are used for data that never changes.
- If you think you may need to change the data in the future, use a class variable.

What’s the difference between a class and a module?

- A module is nothing more than a library for methods.
- A class can be instantiated and a module cannot.

When would you use a class but not a module?

- If you need to create multiple instances of your data and its associated methods.

How does inheritance work?

- Inheritance is the ability of one class to be a child of another class and therefore inherit all its characteristics, including methods and variables.

Why is inheritance really useful?

- It helps keep code DRY.

How do you extend a class? What does that mean?

- By using this syntax `class Viking < Person`
- It means Viking extends Person and thus inherits Person's methods.

What does `#super` do? Why use it?

- It accesses the parent's/superclass's version of the current method where it's used

```
class Viking < Person
  def heal
    2.times { super }
    puts "Ready for battle!"
  end
end
```

## Scope

What is scope?

- Scope is the context in which variables and methods can be used

When can you start using a variable?

- When it is in scope

When is a new scope defined?

- When you first define a variable

When are methods in scope?

What is a private method?

- A method that is only accessible by a particular instance of a class

What is a protected method?

- A method than can be accessed by other instances of the same class

```
class Viking < Person
    ...
    def attack(recipient)
        if recipient.dead
            puts "#{recipient.name} is already dead!"
            return false
        end
        damage = (rand * 10 + 10).round(0)
        recipient.take_damage(damage)  # `take_damage` called on `recipient`!
    end
    protected
        def take_damage(damage)
            self.health -= damage
            puts "Ouch! #{self.name} took #{damage} damage and has #{self.health} health left"
            die if @health <= 0
            # `die` called from within the same object as take_damage was (the `recipient` as well!)
        end
    private
        def die
            puts "#{self.name} has been killed :("
            self.dead = true  # assume we've defined a `dead` instance variable
        end
end

> oleg = Viking.create_warrior("Oleg")
 => #<Viking:0x007ffd4b8b5588 @age=24.58111251562904, @name="Oleg", @health=120, @strength=10, @dead=false>
> sten = Viking.create_warrior("Sten")
 => #<Viking:0x007ffd4b8e1700 @age=28.80998656037281, @name="Sten", @health=120, @strength=10, @dead=false>
> 10.times { oleg.attack(sten) }
Ouch! Sten took 19 damage and has 101 health left
Ouch! Sten took 10 damage and has 91 health left
Ouch! Sten took 13 damage and has 78 health left
Ouch! Sten took 17 damage and has 61 health left
Ouch! Sten took 15 damage and has 46 health left
Ouch! Sten took 11 damage and has 35 health left
Ouch! Sten took 14 damage and has 21 health left
Ouch! Sten took 14 damage and has 7 health left
Ouch! Sten took 18 damage and has -11 health left
Sten has been killed :(
Sten is already dead!
 => 10
> sten
=> #<Viking:0x007ffd4c048840 @age=25.601709008134428, @name="Sten", @health=-11, @strength=10, @dead=true>

```

How are private and protected methods different?

- Protected methods are a lighter version of private methods.
- Private methods are only available to one instance of a class.
- Protected methods are available to other instances of the same class.

What does “encapsulation” mean?

- Encapsulation means the internal implementation of an object is hidden from the outside and exposed only through an interface.
