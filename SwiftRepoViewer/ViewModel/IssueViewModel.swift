//
//  IssuesViewModel.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 25/02/21.
//

import Foundation

public class IssueViewModel {
        
    public typealias UpdatedClosure = () -> ()
    
    private var data:[IssueCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updatedList?()
            }
        }
    }
    
    public var updatedList: UpdatedClosure?
    public var selectedIndex = 0
    
    public init() {}
    
    public func tryFetchData() {
        GitHubApiService.getIssues { (issues, error) in
            if let issues = issues {
                self.data = issues.map { IssueCellViewModel($0) }
            }
        }
    }

    public func numberOfRows() -> Int {
        let rows = self.data.count
        if rows == 0 {
            self.tryFetchData()
        }
        return data.count
    }
    
    public func cellVM(forIndex index: Int) -> IssueCellViewModel {
        if index < self.data.count {
            return self.data[index]
        }
        return IssueCellViewModel(Issue(url: "", htmlUrl: nil, id: 0, title: "", body: "", user: nil, state: nil, createdAt: Date()))
    }
    
    func selectedIssue() -> Issue? {
        return self.data[selectedIndex].issue
    }
    
    
}
