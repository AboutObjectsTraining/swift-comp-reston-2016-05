//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

import Foundation

let documentsURLs = NSFileManager.defaultManager().URLsForDirectory(
    NSSearchPathDirectory.DocumentDirectory, inDomains:
    NSSearchPathDomainMask.UserDomainMask)


// MARK: - File Utilities

func fileURLForDocument(name: String, type: String) -> NSURL
{
    precondition(!documentsURLs.isEmpty, "Documents directory must exist.")
    
    let fileURL = documentsURLs.first!
    return fileURL.URLByAppendingPathComponent(name).URLByAppendingPathExtension(type)
}


// MARK: - ReadingListStore

public class ReadingListStore : NSObject
{
    let storeType = "plist"
    let storeName: String
    let documentURL: NSURL
    
    public init(_ storeName: String)
    {
        self.storeName = storeName
        documentURL = fileURLForDocument(storeName, type: storeType)
        super.init()
    }
    
    public func fetchReadingList() -> ReadingList
    {
        if NSFileManager.defaultManager().fileExistsAtPath(documentURL.path!),
            let dict = NSDictionary(contentsOfURL: documentURL) as? [String: AnyObject]  {
                return ReadingList(dictionary: dict)
        }
        
        let bundle = NSBundle(forClass: ReadingListStore.self)
        guard let URL = bundle.URLForResource(storeName, withExtension: storeType) else {
            fatalError("Unable to locate \(storeName) in app bundle")
        }
        guard let dict = NSDictionary(contentsOfURL: URL) as? [String: AnyObject] else {
            fatalError("Unable to load \(storeName) with bundle URL \(URL)")
        }
        return ReadingList(dictionary: dict)
    }
    
    public func saveReadingList(readingList: ReadingList)
    {
        let dict = readingList.dictionaryRepresentation() as NSDictionary
        dict.writeToURL(documentURL, atomically: true)
    }
}