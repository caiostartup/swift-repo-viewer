//
//  UINib+NibIdentifier.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation
import UIKit

extension UINib {
    
    public convenience init(identifier: CustomIdentifier, bundle: Bundle?) {
        self.init(nibName: identifier.key, bundle: bundle)
    }
}
