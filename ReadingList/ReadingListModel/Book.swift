//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

let TitleKey = "title"
let YearKey = "year"
let AuthorKey = "author"

let Unknown = "unknown"

public class Book: ModelObject
{
    public var title = ""
    public var year = ""
    public var author: Author?
    
    public override var description: String {
        return "\(title), \(year), \(author ?? Unknown)"
    }
    
    override class func keys() -> [String]
    {
        return [TitleKey, YearKey, AuthorKey]
    }
    
    public required init(dictionary: [String : AnyObject])
    {
        var bookInfo = dictionary
        if let authorInfo = dictionary[AuthorKey] as? [String: AnyObject] {
            bookInfo[AuthorKey] = Author(dictionary: authorInfo)
        }
        
        super.init(dictionary: bookInfo)
    }
    
    public override func dictionaryRepresentation() -> [String: AnyObject]
    {
        var dict = super.dictionaryRepresentation()
        if let author = dict[AuthorKey] as? Author {
            dict[AuthorKey] = author.dictionaryRepresentation()
        }
        
        return dict
    }
}

