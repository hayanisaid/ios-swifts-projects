import UIKit

var str = "Hello, playground"

struct user{
    
    var name = "Said"
    var lastname:String = "Hayani"
    var lang = "JS"
    
    func getName ()->String{
        return name
    }
    func getLastName() -> String{
        return lastname
    }
    mutating func changeName (newName:String)-> Void{
        return name = newName
    }
}

var me = user(name: "Johm",lastname:"him" lang: "Python")
me.lang = "Swift"

var changeName = user()
changeName.changeName(newName: "hala")

print(changeName)
