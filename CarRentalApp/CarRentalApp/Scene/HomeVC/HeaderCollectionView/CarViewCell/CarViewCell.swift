//
//  CarViewCell.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 23.12.24.
//

import UIKit

class CarViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var carCountLabel: UILabel!
    @IBOutlet private weak var segmentLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    var callUI: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        background.backgroundColor = .white
        segmentLabel.textColor = .black
        carCountLabel.textColor = .lightGray
        background.layer.cornerRadius = background.frame.height / 6
        
    }
    
    func callElement(segment: String, carCount: String, image: String) {
        carCountLabel.text = carCount
        segmentLabel.text = segment
        carImage.image = UIImage(named: image)
    }
    
    func changebackgroundColor(backgroundColor: UIColor, carCountColor: UIColor, segmentColor: UIColor) {
        background.backgroundColor = backgroundColor
        carCountLabel.textColor = carCountColor
        segmentLabel.textColor = segmentColor
    }

}
