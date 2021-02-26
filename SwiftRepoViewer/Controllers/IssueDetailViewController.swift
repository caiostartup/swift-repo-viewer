//
//  IssueDetailViewController.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import UIKit

class IssueDetailViewController: UIViewController {

    public var issue: Issue!
    public var issueDetailViewModel = IssueDetailViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var openLinkButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        issueDetailViewModel.issue = self.issue
        prepareAvatar()
        prepareLabels()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private methods
    private func prepareLabels() {
        titleLabel.text = issueDetailViewModel.labelTitleValue()
        descLabel.text = issueDetailViewModel.labelDescValue()
        createdDateLabel.text = issueDetailViewModel.labelCreatedDateValue()
        openLinkButton.setTitle(issueDetailViewModel.labelLinkValue(), for: .normal)
            
        
    }
    
    private func prepareAvatar() {
        issueDetailViewModel.loadImage(avatarImageView)
    }
    

    // MARK: - Actions
    @IBAction func openRepositoryLink(_ sender: Any) {
        issueDetailViewModel.openLink()
    }
    
}
