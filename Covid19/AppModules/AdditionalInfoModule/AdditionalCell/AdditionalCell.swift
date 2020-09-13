//
//  AdditionalCell.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit

class AdditionalCell: UICollectionViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!

    
    //MARK: View Setup
    func configure(with additionalInfo: AdditionalInfo)  {
        self.titleTxt.text = additionalInfo.title
        self.descriptionTxt.text = String(additionalInfo.description)
    }
}
