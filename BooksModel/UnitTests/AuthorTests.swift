import XCTest

private let FirstName = "Fred"
private let LastName = "Smith"

class AuthorTests: XCTestCase {
    
    var author: Author!
    
    override func setUp() {
        super.setUp()
        author = Author()
    }
    
    func testPopulateAuthor() {
        print(author)
        author.firstName = FirstName
        print(author)
        author.lastName = LastName
        print(author)
    }
}
