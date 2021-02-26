//
//  State.swift
//  Swift Repo Viewer
//
//  Created by Caio Mansho on 24/02/21.
//

import Foundation

enum State: String, Codable {
    case open
    case closed
    case all
    
    func getValue() -> String {
        switch self {
        case .open:
            return String(withCustomIdentifier: StringIdentifier.issueOpen)
        case .closed:
            return String(withCustomIdentifier: StringIdentifier.issueClosed)
        case .all:
            return String(withCustomIdentifier: StringIdentifier.issueAll)
        }
    }
}
