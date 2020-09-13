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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.traitCollection.userInterfaceStyle == .dark ? configureView(isDarkTheme: true) : configureView(isDarkTheme: false)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard UIApplication.shared.applicationState == .inactive else { return }
        
        self.traitCollection.userInterfaceStyle == .dark ? configureView(isDarkTheme: true) : configureView(isDarkTheme: false)
    }
    
    //MARK: View Setup
    func configure(with country: Country)  {
        self.confirmedCasesLbl.text = String(country.totalConfirmed)
        self.RecoveredNumberLbl.text = String(country.totalRecovered)
        self.deadNumberLbl.text = String(country.totalDeaths)
        self.countryLbl.text = String(country.country)
    }

    
    func configureView(isDarkTheme: Bool) {
        [RecoveredNumberLbl,confirmedCasesLbl,deadNumberLbl].forEach { (label) in
            isDarkTheme ? (label?.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) : (label?.textColor = #colorLiteral(red: 0.05882352941, green: 0.05098039216, blue: 0.1411764706, alpha: 1))
        }
        
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 2.0
        self.contentView.layer.borderColor = isDarkTheme ? #colorLiteral(red: 0.5568627451, green: 0.5529411765, blue: 0.6274509804, alpha: 1) : #colorLiteral(red: 0.5176470588, green: 0.4901960784, blue: 0.9333333333, alpha: 1)
        self.contentView.layer.masksToBounds = true
        isDarkTheme ? (self.contentView.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : (self.contentView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
}
