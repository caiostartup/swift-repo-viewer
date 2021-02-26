//
//  IssueDetailViewModel.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation
import UIKit
import SDWebImage

class IssueDetailViewModel : NSObject {
    
    public var issue : Issue!
        
    override init() {
        super.init()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
    }
    
    public func labelTitleValue() -> String {
        return self.issue.title
    }
    
    public func labelDescValue() -> String {
        return self.issue.body ?? ""
    }
    
    public func labelCreatedDateValue() -> String {
        guard let createdAt = self.issue.createdAt else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: createdAt)
    }
    
    public func labelLinkValue() -> String {
        return String(withCustomIdentifier: StringIdentifier.openOnGithub)
    }
    
    public func openLink() {
        if let htmlUrl = issue.htmlUrl {
            UIApplication.shared.open(htmlUrl)
        }
    }
    
    public func loadImage(_ imageView: UIImageView) {
        if let url = issue.user?.avatarURL {
            imageView.sd_setImage(with: URL(string: url))
            imageView.layer.cornerRadius = 45
            imageView.layer.masksToBounds = true
        }
    }
}
