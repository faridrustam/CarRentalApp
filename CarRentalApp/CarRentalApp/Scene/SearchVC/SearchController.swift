//
//  SearchController.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 26.12.24.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var backgroundSearch: UIView!
    
    let carCoreData = CarDetailCoreData()
    var carItems = [CarList]()
    var searchedCars: [CarList] = []
    var filteredCars: [CarList] = []
    let userDefaultsManager = UserDefaultsManager()
    let carsData = CarsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getItems()
    }
    
    func configureUI() {
        collection.delegate = self
        collection.dataSource = self
        
        title = "Search"
        
        backgroundSearch.layer.cornerRadius = backgroundSearch.frame.height / 2
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .editingChanged)
        searchFieldUI()
        
        collection.register(UINib(nibName: "CarDetailCell", bundle: nil), forCellWithReuseIdentifier: "CarDetailCell")
    }
    
    @objc func searchTextFieldDidChange() {
        if let searchText = searchTextField.text {
            if searchText.isEmpty {
                searchedCars = carItems
                collection.reloadData()
            } else {
                filterSearch()
            }
        }
    }
    
    func filterSearch() {
        filteredCars = carItems.filter { $0.carName?.lowercased() == searchTextField.text?.lowercased() }
        collection.reloadData()
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
    
    func getItems() {
        if !userDefaultsManager.getValue(key: .saved) && !userDefaultsManager.getValue(key: .carSaved)  {
            carsData.saveData()
        }
        
        carCoreData.fetchData {
            self.carItems = self.carCoreData.carItems
            self.collection.reloadData()
        }
    }
}

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if !filteredCars.isEmpty {
                return filteredCars.count
            } else {
                return carCoreData.carItems.count
            }
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CarDetailCell.self)", for: indexPath) as! CarDetailCell
        if !filteredCars.isEmpty {
            let data = filteredCars[indexPath.item]
            
            cell.callElement(carName: data.carName ?? "",
                             model: data.carModel ?? "",
                             engineDetail: data.engine ?? "",
                             price: data.price ?? "",
                             image: data.image ?? "")
        } else {
            let data = carCoreData.carItems[indexPath.item]
            
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
}
