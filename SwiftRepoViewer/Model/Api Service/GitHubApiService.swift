//
//  GitHubApiService.swift
//  Swift Repo Viewer
//
//  Created by Caio Mansho on 25/02/21.
//

import Foundation
import Moya

class GitHubApiService {
    
    class func getIssues(completion: @escaping ([Issue]?, Error?) -> ()) {
        gitHubProvider.request(.issues) { result in
            do {
                let response = try result.get()
                let decoder = JSONDecoder()
                do {
                    let issues = try decoder.decode([Issue].self, from: response.data)
                    completion(issues, nil)
                } catch let error as DecodingError {
                    switch error {
                    case .typeMismatch(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                        print("error \(key), and ERROR: \(error.localizedDescription)")
                    default:
                        print("ERROR: \(error.localizedDescription)")
                    }
                }
            } catch {
                let printableError = error as CustomStringConvertible
                //                self.showAlert("GitHub Fetch", message: printableError.description)
            }
        }
    }
}
