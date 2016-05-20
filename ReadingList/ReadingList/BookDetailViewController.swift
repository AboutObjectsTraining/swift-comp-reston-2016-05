//
//  BookDetailViewController.swift
//  ReadingList
//
//  Created by Student on 5/19/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class BookDetailViewController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleCell: BookDetailCell!
    @IBOutlet weak var yearCell: BookDetailCell!
    @IBOutlet weak var firstNameCell: BookDetailCell!
    @IBOutlet weak var lastNameCell: BookDetailCell!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        titleCell.detailLabel?.text = book?.title
        yearCell.detailLabel?.text = book?.year
        firstNameCell.detailLabel?.text = book?.author?.firstName
        lastNameCell.detailLabel?.text = book?.author?.lastName
        
        imageView.image = book?.author?.image
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let navController = segue.destinationViewController as? UINavigationController,
            editController = navController.childViewControllers.first as? BookEditViewController else {
                return
        }
        
        editController.book = book
    }
}






