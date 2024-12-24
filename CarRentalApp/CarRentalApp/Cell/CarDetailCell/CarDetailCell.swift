//
//  CarDetailCell.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 23.12.24.
//

import UIKit

class CarDetailCell: UICollectionViewCell {

    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var carNameLabel: UILabel!
    @IBOutlet private weak var modelLabel: UILabel!
    @IBOutlet private weak var engineDetailLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        background.layer.cornerRadius = background.frame.height / 6
    }
    
    func callElement(carName: String, model: String, engineDetail: String, price: String, image: String) {
        carNameLabel.text = carName
        modelLabel.text = model
        engineDetailLabel.text = engineDetail
        priceLabel.text = price
        carImage.image = UIImage(named: image)
    }
    
}
