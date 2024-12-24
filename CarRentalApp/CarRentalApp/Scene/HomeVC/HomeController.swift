//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    
    let carsData = CarsData()
    let carCoreData = CarCoreData()
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        title = "Car Rental"
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        searchFieldUI()
        carsData.loadData()
        carsData.carData.fetchData()
               
        topCollectionView.register(UINib(nibName: "CarDetailCell", bundle: nil), forCellWithReuseIdentifier: "CarDetailCell")
        topCollectionView.register(
            UINib(nibName: "CategoryView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "CategoryView")
    }
    
    func searchFieldUI() {
        searchTextField.placeholder = "Search for a car"
        searchTextField.layer.cornerRadius = (searchTextField.layer.frame.height / 2)
        searchTextField.layer.masksToBounds = true
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .black
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: searchTextField.frame.height))
        searchIcon.frame = CGRect(x: 0, y: 20, width: 20, height: 20)
        rightView.addSubview(searchIcon)
        searchTextField.rightView = rightView
        searchTextField.rightViewMode = .always
    }

}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carCoreData.carItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarDetailCell.self)", for: indexPath) as! CarDetailCell
        let data = carCoreData.carItems[indexPath.item]
        cell.callElement(carName: data.carName ?? "", model: data.carModel ?? "", engineDetail: data.engine ?? "", price: data.price ?? "", image: data.image ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 370, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = topCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoryView", for: indexPath) as! CategoryView
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}
