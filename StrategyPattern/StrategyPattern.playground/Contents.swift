//: Playground - noun: a place where people can play

import UIKit
import ObjectiveC


private var AssociationKey: UInt8 = 0

//-----Abstract superclass-----//
protocol Role {
    func display()
}

extension Role {
    var weaponBehavior: WeaponBehavior? {
        get {
            return objc_getAssociatedObject(self, &AssociationKey) as? WeaponBehavior
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    mutating func setWeapon(weaponBehavior: WeaponBehavior?) {
        self.weaponBehavior = weaponBehavior
    }
    
    func performWeapon() {
        weaponBehavior?.useWeapon()
    }
}


//-----Subclass-----//
class King: Role {
    func display() {
        print("I'am the King.")
    }
}

class Queen: Role {
    func display() {
        print("I'am the Queen.")
    }
}

class Knight: Role {
    func display() {
        print("I'am the Knight.")
    }
}

class Troll: Role {
    func display() {
        print("I'am the Troll.")
    }
}


//-----Behavior-----//
protocol WeaponBehavior {
    func useWeapon()
}

class KnifeBehavior: WeaponBehavior {
    func useWeapon() {
        print("Fight with knife.")
    }
}

class BowAndArrowBehavior: WeaponBehavior {
    func useWeapon() {
        print("Fight with bow and arrow.")
    }
}

class AxeBehavior: WeaponBehavior {
    func useWeapon() {
        print("Fight with axe.")
    }
}

class SwordBehavior: WeaponBehavior {
    func useWeapon() {
        print("Fight with sword.")
    }
}

//-----Test-----//
var role: Role = King()
var weapon: WeaponBehavior = KnifeBehavior()
role.setWeapon(weaponBehavior: weapon)
role.display()
role.performWeapon()
print("---Change the weapon.---")
weapon = SwordBehavior()
role.setWeapon(weaponBehavior: weapon)
role.performWeapon()
print("---Change the role.---")
role = Queen()
role.display()
role.performWeapon() // didn't setting the weapon yet.
role.setWeapon(weaponBehavior: weapon)
role.performWeapon()
