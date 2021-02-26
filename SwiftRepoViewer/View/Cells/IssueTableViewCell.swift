//
//  IssueTableViewCell.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 25/02/21.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func setup(viewModel: IssueCellViewModel) {
        self.titleLabel.text = viewModel.labelTitleValue()
        self.statusLabel.text = viewModel.labelStateValue()
    }
    
}
