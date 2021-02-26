//
//  NibIdentifier.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation
import UIKit

enum NibIdentifier: String, CustomIdentifier {
    
    case issueTableViewCell = "IssueTableViewCell"
    
}

extension NibIdentifier {
    
    func getNib() -> UINib {
        return UINib(identifier: self, bundle: nil)
        
    }
    
}
