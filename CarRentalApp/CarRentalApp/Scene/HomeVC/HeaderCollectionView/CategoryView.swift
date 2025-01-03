//
//  CategoryView.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import UIKit

class CategoryView: UICollectionReusableView {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    private var items = [CategoryList]()
    var categoryTapped: ((CategoryList) -> Void)?
    private var selectedCell: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 127, height: 135)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        headerCollectionView.collectionViewLayout = layout
        headerCollectionView.showsHorizontalScrollIndicator = false
        
        headerCollectionView.register(UINib(nibName: "CarViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: "\(CarViewCell.self)")
    }
    
    func configure(data: [CategoryList]) {
        items = data
        headerCollectionView.reloadData()
    }
}

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarViewCell.self)", for: indexPath) as! CarViewCell
        let data = items[indexPath.item]
        let isSelected = (indexPath == selectedCell)
        cell.updateBackground(isSelected: isSelected)
        cell.callElement(segment: data.segment ?? "",
                         carCount: data.carCount ?? "",
                         image: data.image ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousCellIndex = selectedCell
        selectedCell = indexPath
        
        if let previousCellIndex = previousCellIndex {
            collectionView.reloadItems(at: [previousCellIndex])
        }
        collectionView.reloadItems(at: [indexPath])
        
        let selectedCategory = items[indexPath.item]
        categoryTapped?(selectedCategory)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 130, height: 140)
    }
}
