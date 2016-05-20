import UIKit

private let storeName = "BooksAndAuthors"

class ReadingListViewController: UITableViewController
{
    let foobar = "Wheee"
    let store = ReadingListStore(storeName)
    lazy var readingList: ReadingList = { return self.store.fetchReadingList() }()
    
    // MARK: Unwind Segues
    
    @IBAction func addBook(segue: UIStoryboardSegue) { }
    @IBAction func cancelAddBook(segue: UIStoryboardSegue) { }
    
    @IBAction func doneEditingBook(segue: UIStoryboardSegue) {
        tableView.reloadData()
        store.saveReadingList(readingList)
    }
    @IBAction func cancelEditingBook(segue: UIStoryboardSegue) { }
}


// MARK: Overridden UIViewController Methods

extension ReadingListViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        guard let detailController = segue.destinationViewController as? BookDetailViewController else {
            return
        }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            detailController.book = readingList.books[indexPath.row]
        }
    }
}


// MARK: UITableViewDataSource

extension ReadingListViewController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return readingList.books.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Book Summary") else {
            fatalError("Unable to obtain a cell with reuse identifier 'Book Summary'")
        }
        
        populate(cell: cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func populate(cell cell: UITableViewCell, atIndexPath indexPath: NSIndexPath)
    {
        let book = readingList.books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year)  \(book.author?.fullName ?? "")"
        cell.imageView?.image = book.author?.image
    }
}

extension UIImage
{
    static var defaultImage: UIImage {
        guard let image = UIImage(named: "NoImage") else { fatalError("Unable to load default image") }
        return image
    }
}

extension Author
{
    var image: UIImage {
        return UIImage(named: lastName ?? "") ?? UIImage.defaultImage
    }
}


