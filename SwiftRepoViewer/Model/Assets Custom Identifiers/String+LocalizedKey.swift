//
//  String+LocalizedKey.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation

extension String  {
    
    public init(withCustomIdentifier identifier: CustomIdentifier) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }

}
