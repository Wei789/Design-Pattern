//: Playground - noun: a place where people can play

import UIKit

//-----Component-----//
protocol Beverage {
    func cost() -> Double
    func getDescription() -> String
}


//-----Concrete Component-----//
class Coffee: Beverage {
    func cost() -> Double {
        return 1.20
    }
    
    func getDescription() -> String {
        return "Caffee"
    }
}


//-----Decorator-----//
class CondimentDecorator: Beverage {
    let beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return self.beverage.cost()
    }
    
    func getDescription() -> String {
        return self.beverage.getDescription()
    }
}


//-----Concrete Decorator-----//
class Sugar: CondimentDecorator {
    override func cost() -> Double {
        return self.beverage.cost() +  0.20
    }
    
    override func getDescription() -> String {
        return self.beverage.getDescription() + " ,Sugar"
    }
}


//----Testing-----//
var coffee: Beverage = Coffee()
print(coffee.cost())
print(coffee.getDescription())
coffee = Sugar(beverage: coffee)
print(coffee.cost())
print(coffee.getDescription())




