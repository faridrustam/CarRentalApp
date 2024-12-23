//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        title = "Car Rental"
        searchFieldUI()
        
        topCollectionView.register(UINib(nibName: "\(CarDetailCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CarDetailCell.self)")
        
        topCollectionView.register(UINib(nibName: "\(CarViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CarViewCell.self)")
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
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
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarViewCell.self)", for: indexPath) as! CarViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 135)
    }
}
