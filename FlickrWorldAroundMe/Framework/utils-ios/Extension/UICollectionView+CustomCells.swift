//
//  UICollectionView+CustomCells.swift
//  Watsons
//
//  Created by Daniele Salvioni on 24/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UICollectionView
{
    func registerCell<T: UICollectionViewCell>(nibClass: T.Type)
    {
        self.register(UINib(nibName: String(describing: nibClass), bundle: nil), forCellWithReuseIdentifier: String(describing: nibClass))
    }
}
