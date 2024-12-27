//
//  HomeController.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 21.12.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var topCollectionView: UICollectionView!
    @IBOutlet private weak var searchTextField: UITextField!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getItems()
    }
    
    @IBAction func searchFieldTyped(_ sender: Any) {
        if let searchText = searchTextField.text {
            if searchText.isEmpty {
                viewModel.searchedCars = viewModel.carItems
                topCollectionView.reloadData()
            } else {
                filterSearch()
            }
        }
    }
    
    func configureUI() {
        title = "Car Rental"
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        searchFieldUI()
        
        topCollectionView.register(UINib(nibName: "CarDetailCell", bundle: nil), forCellWithReuseIdentifier: "CarDetailCell")
        topCollectionView.register(UINib(nibName: "CategoryView", bundle: nil),
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
        searchIcon.frame = CGRect(x: -10, y: 20, width: 20, height: 20)
        rightView.addSubview(searchIcon)
        searchTextField.rightView = rightView
        searchTextField.rightViewMode = .always
    }
    
    func filterSearch() {
        viewModel.filteredCars = viewModel.carItems.filter { $0.carName?.lowercased() == searchTextField.text?.lowercased() }
        topCollectionView.reloadData()
    }
    
    func filterCarsByCategory(category: CategoryList) {
        viewModel.filteredCars = viewModel.carItems.filter { $0.category == category.segment }
            topCollectionView.reloadData()
        }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !viewModel.filteredCars.isEmpty {
            return viewModel.filteredCars.count
        } else {
            return viewModel.carCoreData.carItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarDetailCell.self)", for: indexPath) as! CarDetailCell
        if !viewModel.filteredCars.isEmpty {
            let data = viewModel.filteredCars[indexPath.item]
            
            cell.callElement(carName: data.carName ?? "",
                             model: data.carModel ?? "",
                             engineDetail: data.engine ?? "",
                             price: data.price ?? "",
                             image: data.image ?? "")
        } else {
            let data = viewModel.carCoreData.carItems[indexPath.item]
            
            cell.callElement(carName: data.carName ?? "",
                             model: data.carModel ?? "",
                             engineDetail: data.engine ?? "",
                             price: data.price ?? "",
                             image: data.image ?? "")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 370, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoryView", for: indexPath) as! CategoryView
        header.configure(data: viewModel.categoryItems)
        header.categoryTapped = { [weak self] selectedCategory in
            self?.filterCarsByCategory(category: selectedCategory)
        }
        header.changeUI()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
}
