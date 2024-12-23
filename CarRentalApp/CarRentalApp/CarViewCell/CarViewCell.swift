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
    
    func callElement(carCount: Int, segment: String) {
        carCountLabel.text = "\(carCount)"
        segmentLabel.text = segment
    }

}
