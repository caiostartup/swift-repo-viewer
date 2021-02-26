//
//  StringIdentifier.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation

public enum StringIdentifier: String, CustomIdentifier {
    
    // Issue State
    case issueOpen
    case issueClosed
    case issueAll
    case openOnGithub
    
}

extension StringIdentifier {
    
    public func getString() -> String {
        return String(withCustomIdentifier: self)
    }
    
    
}
