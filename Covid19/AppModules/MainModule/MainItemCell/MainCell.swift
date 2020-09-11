//
//  MainCell.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    
    //MARK: IBOutlet
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var confirmedCasesLbl: UILabel!
    @IBOutlet weak var RecoveredNumberLbl: UILabel!
    @IBOutlet weak var deadNumberLbl: UILabel!
    
    //MARK: View Setup
    func configure(with country: Country)  {
        self.confirmedCasesLbl.text = String(country.TotalConfirmed)
        self.RecoveredNumberLbl.text = String(country.TotalRecovered)
        self.deadNumberLbl.text = String(country.TotalDeaths)
        self.countryLbl.text = String(country.Country)
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.blue.cgColor
        self.contentView.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
}
