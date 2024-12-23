//
//  CategoryView.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import UIKit

class CategoryView: UICollectionReusableView {

    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let layout = UICollectionViewFlowLayout()
//                layout.scrollDirection = .horizontal
//                layout.itemSize = CGSize(width: 100, height: 100)
//                layout.minimumLineSpacing = 10
//                headerCollectionView.collectionViewLayout = layout
//                headerCollectionView.showsHorizontalScrollIndicator = false
        
        headerCollectionView.register(CarViewCell.self, forCellWithReuseIdentifier: "\(CarViewCell.self)")
    }
    
}
