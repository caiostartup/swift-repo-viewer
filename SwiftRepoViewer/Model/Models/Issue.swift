//
//  Issue.swift
//  Swift Repo Viewer
//
//  Created by Caio Mansho on 24/02/21.
//

import Foundation

struct Issue: Codable {
    let url: String
    let htmlUrl: URL?
    let id: Int
    let title: String
    let body: String?
    let user: User?
    let state: State?
    let createdAt: Date?
    
    public init(
        url: String,
        htmlUrl: URL?,
        id: Int,
        title: String,
        body: String?,
        user: User?,
        state: State?,
        createdAt: Date?
    ) {
        self.url = url
        self.htmlUrl = htmlUrl
        self.id = id
        self.title = title
        self.body = body
        self.user = user
        self.state = state
        self.createdAt = createdAt

    }
    
    public func description() -> String {
        return "\(self.id) - \(self.title)"
    }
    
    enum CodingKeys: String, CodingKey {
        case url
        case htmlUrl = "html_url"
        case body
        case id
        case title, user, state
        case createdAt = "created_at"
    }
}

extension Issue {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(String.self, forKey: .url)
        body = try container.decode(String.self, forKey: .body)
        htmlUrl = try container.decode(URL.self, forKey: .htmlUrl)
        id = try container.decode(Int.self, forKey: .id)
        user = try container.decode(User.self, forKey: .user)
        title = try container.decode(String.self, forKey: .title)
        state = try container.decode(State.self, forKey: .state)
        
        let dateString = try container.decode(String.self, forKey: .createdAt)
        let formatter = DateFormatter.basic
        if let date = formatter.date(from: dateString) {
            createdAt = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt,
                                                   in: container,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }
    }
}
