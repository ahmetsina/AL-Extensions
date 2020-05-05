//
//  AL-UICollectionView.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension UICollectionView {
    
    /// Check existing of indexpath in collectionview
    /// - Parameter indexPath: Target indexpath
    /// - Returns: Result of search
    func exist(indexPath: IndexPath) -> Bool {
        indexPath.section < self.numberOfSections && indexPath.item < self.numberOfItems(inSection: indexPath.section)
    }
    
}
