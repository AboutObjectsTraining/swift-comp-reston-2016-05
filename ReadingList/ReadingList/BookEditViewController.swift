//
//  BookEditViewController.swift
//  ReadingList
//
//  Created by Student on 5/19/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class BookEditViewController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleField.text = book?.title
        yearField.text = book?.year
        firstNameField.text = book?.author?.firstName
        lastNameField.text = book?.author?.lastName
    }
    
    func populateBook()
    {
        book?.title = titleField.text ?? ""
        book?.year = yearField.text ?? ""
        book?.author?.firstName = firstNameField.text ?? ""
        book?.author?.lastName = lastNameField.text ?? ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier != "Cancel" else { return }
        populateBook()
    }
}
