import Foundation

class Author: NSObject
{
    var firstName: String?
    var lastName: String?
    
    var fullName: String {
        if firstName == nil && lastName == nil { return "Unknown" }
        if let firstName = firstName where lastName == nil { return firstName }
        if let lastName = lastName where firstName == nil { return lastName }
        return String(format: "\(lastName ?? ""), \(firstName ?? "")")
    }
    
    override var description: String {
        return fullName
    }
}

