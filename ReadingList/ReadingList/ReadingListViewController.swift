import UIKit

class ReadingListViewController: UITableViewController
{
    // MARK: Unwind Segues
    
    @IBAction func addBook(segue: UIStoryboardSegue) { }
    @IBAction func cancelAddBook(segue: UIStoryboardSegue) { }
    
    @IBAction func doneEditingBook(segue: UIStoryboardSegue) { }
    @IBAction func cancelEditingBook(segue: UIStoryboardSegue) { }
}


// MARK: UITableViewDataSource

extension ReadingListViewController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100 // FIXME: replace hardcoded value!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        
        return cell
    }
}