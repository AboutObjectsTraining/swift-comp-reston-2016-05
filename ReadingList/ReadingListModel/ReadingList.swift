//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

let BooksKey = "books"

protocol PropertyKeys
{
    var all: [String] { get }
}

public class ReadingList: ModelObject
{    
    public var title = ""
    public var books = [Book]()
    
    public override var description: String {
        var s = "Title: \(title)\nCount: \(books.count)\nBooks:\n------\n"
        for (index, book) in books.enumerate() {
            s += "\(index + 1). \(book)\n"
        }
        return s
    }
    
    override class func keys() -> [String]
    {
        return [TitleKey, BooksKey]
    }
    
    public override func setValue(value: AnyObject?, forKey key: String)
    {
        var mappedValue: AnyObject?
        if key == BooksKey, let dicts = value as? [[String: AnyObject]] {
            mappedValue = dicts.map { Book(dictionary: $0) }
        }
        
        super.setValue(mappedValue ?? value, forKey: key)
    }
    
    public override func dictionaryRepresentation() -> [String: AnyObject]
    {
        var dict = super.dictionaryRepresentation()

        if let books = dict[BooksKey] as? [ModelObject] {
            dict[BooksKey] = books.map { $0.dictionaryRepresentation() }
        }
        
        return dict
    }
}