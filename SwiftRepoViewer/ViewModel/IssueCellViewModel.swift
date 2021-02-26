//
//  IssuesCellViewModel.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 25/02/21.
//

import Foundation

public class IssueCellViewModel {
    let issue: Issue
    init(_ issue: Issue) {
        self.issue = issue
    }
    public func labelTitleValue() -> String {
        return self.issue.title
    }
    public func labelStateValue() -> String {
        return self.issue.state?.getValue() ?? ""
    }

}
