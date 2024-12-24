//
//  CategoryView.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import UIKit

class CategoryView: UICollectionReusableView {

    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    let coreData = CategoryCoreData()
    let categoryList = CarsData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        coreData.fetchData()
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
}

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of items in section: \(coreData.categoryItems.count)")
        return coreData.categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarViewCell.self)", for: indexPath) as! CarViewCell
        let data = coreData.categoryItems[indexPath.item]
        cell.callElement(segment: data.segment ?? "", carCount: data.carCount ?? "", image: data.image ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 130, height: 140)
    }
}
