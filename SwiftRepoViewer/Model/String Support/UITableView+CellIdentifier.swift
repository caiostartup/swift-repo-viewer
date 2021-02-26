//
//  UITableView+CellIdentifier.swift
//  SwiftRepoViewer
//
//  Created by Caio Mansho on 26/02/21.
//

import Foundation
import UIKit

extension UITableView {

    public func dequeueReusableCellWithIdentifier(_ identifier: CustomIdentifier, forIndexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier.key, for: forIndexPath)
    }
    
    public func registerNib(_ nib: UINib?, forCellReuseIdentifier identifier: CustomIdentifier) {
        return register(nib, forCellReuseIdentifier: identifier.key)
    }
    
    public func dequeueReusableHeaderFooterViewWithIdentifier(_ identifier: CustomIdentifier) -> UIView? {
        return dequeueReusableHeaderFooterView(withIdentifier: identifier.key)
    }
    
    public func registerNib(_ nib: UINib?,  forHeaderFooterViewReuseIdentifier identifier: CustomIdentifier) {
        return register(nib, forHeaderFooterViewReuseIdentifier: identifier.key)
    }
}
    
