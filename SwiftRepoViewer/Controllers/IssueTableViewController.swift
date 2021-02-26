//
//  IssuesTableViewController.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 25/02/21.
//

import UIKit

class IssueTableViewController: UITableViewController {

    private let issueViewModel = IssueViewModel()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift Repo Viwer"
        prepareTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issueViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifier.issueCell, forIndexPath: indexPath) as! IssueTableViewCell

        // Configure the cell...
        let cellVM = self.issueViewModel.cellVM(forIndex: indexPath.row) as IssueCellViewModel
        cell.setup(viewModel: cellVM)
        return cell

    }
    
    // MARK: -
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Unselect the row, and instead, show the state with a checkmark.
        tableView.deselectRow(at: indexPath, animated: false)
        issueViewModel.selectedIndex = indexPath.row
        performSegueWithIdentifier(SegueIdentifier.issueDetailSegue, sender: self)
    }
    
    // MARK: - Private Methods
    private func prepareTableView() {
        self.tableView.registerNib(NibIdentifier.issueTableViewCell.getNib(), forCellReuseIdentifier: TableViewCellIdentifier.issueCell)
        issueViewModel.updatedList = {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        issueViewModel.tryFetchData()
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segueIdentifierForSegue(segue) {
        case .issueDetailSegue:
            guard let vc = segue.destination as? IssueDetailViewController else {
                return
            }
            if let issue = issueViewModel.selectedIssue() {
                vc.issue = issue
            }
        }
    }
    

}

//MARK: - SegueHandlerType
extension IssueTableViewController: SegueHandlerType {

    public enum SegueIdentifier: String {
        case issueDetailSegue
    }

}
