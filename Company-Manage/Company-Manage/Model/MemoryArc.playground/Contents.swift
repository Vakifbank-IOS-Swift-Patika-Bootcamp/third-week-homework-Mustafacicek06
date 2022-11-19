import Foundation

// How ARC Works

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var referencePerson: Person?
var referencePerson2: Person?
var referencePerson3: Person?

referencePerson = Person(name: "Hamza")
referencePerson2 = referencePerson
referencePerson3 = referencePerson

// hepsini nilleyince deinit oluyor
referencePerson = nil
referencePerson2 = nil
referencePerson3 = nil

// Strong Reference Cycles Between Class Instances
class NewPerson {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) i s being deinit.")
    }
}

class Apartment {
    let unit: String
    var person: NewPerson?
    init(unit: String) {
        self.unit =  unit
    }
    deinit {
        print("\(unit) is being deinit")
    }
}


var jhon: NewPerson?
var unit41: Apartment?

jhon = NewPerson(name: "Mike")
unit41 = Apartment(unit: "41")

jhon?.apartment = unit41
unit41?.person = jhon

// deinit olmadı çünkü hala birbirini strong ile tutuyor
jhon = nil
unit41 = nil

//Rewsolving Stron Reference Cycles
// weak verdiğinde bi taraf silindiğinde diğer taraftaki objeye otomatik olarak nil atıyor

class WeakPerson {
    let name: String
    var apartment: WeakApartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinit")
    }
}

class WeakApartment {
    let unit: String
    weak var person: WeakPerson?
    init(unit: String) {
        self.unit =  unit
    }
    deinit {
        print("\(unit) is being deinit")
    }
}

var weakJhon: WeakPerson?
var weakUnit4A: WeakApartment?

weakJhon = WeakPerson(name: "Weak Jhon")
weakUnit4A = WeakApartment(unit: "Weak 4A")
weakJhon?.apartment = weakUnit4A
weakUnit4A?.person = weakJhon


weakJhon = nil
// artık apartment'in person'u nil
weakUnit4A = nil

//Unowned
// aynı anda deinit ederken kullanmayı tercih ediyoruz
class Customer {
    let name: String
    var creditCard: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deşnitialize")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card \(number) is deinit")
    }
}

var unownedJhon: Customer?
unownedJhon = Customer(name: "Unowned Jhon")
unownedJhon?.creditCard = CreditCard(number: 1234_4567_12344_2144, customer: unownedJhon!)

unownedJhon = nil

//Strong Reference Closures

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        // selfin icindeki property'i kullanıyorsun
        // capture listini almayı unutma demek için
        // self kullanıyoruz
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        }
        else {
            return "<\(self.name)>"
        }
            
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinit")
    }
    
}

let heading = HTMLElement(name: "h1")
let defaultText = "Default Text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText )<\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello")

print(paragraph?.asHTML())
// silinmiyor çünkü hala duruyor referans
paragraph = nil

//Resloving Stron Reference Cycles for Closures - Retain cycle
// Closure'lerde reference type memory'de tanımlanması
// Closure'de class'ın instancesini self ile kullandığı için
// retain cycle olusuyor
class HTMLElementResolved {
    let name: String
    let text: String?
    
    // capture listi belirtmiş olduk
    lazy var asHTML: () -> String = { [weak self] in // unowned self
        // selfin icindeki property'i kullanıyorsun
        // capture listini almayı unutma demek için
        // self kullanıyoruz
        guard let self = self else { return ""}
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        }
        else {
            return "<\(self.name)>"
        }
            
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinit")
    }
    
}

var paragraphResolved: HTMLElementResolved? = HTMLElementResolved(name: "p",text: "Hello World")

print(paragraphResolved?.asHTML())
paragraphResolved = nil
