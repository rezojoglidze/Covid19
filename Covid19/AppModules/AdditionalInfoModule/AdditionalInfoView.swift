//
//  AdditionalInfoView.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit

struct AdditionalInfo {
    let title, description: String
}

//MARK: AdditionalInfoView Class
final class AdditionalInfoView: UserInterface {
    
    //MARK: class Variables
    var additionalInfo: [AdditionalInfo] = []
    var defaultArray : [String] = []
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        navigationItem.title = "დეტალები"
    }
    
    //MARK: View Setup
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "AdditionalCell", bundle: nil), forCellWithReuseIdentifier: "AdditionalCell")
    }
    
    func makeArray(with country: Country) {
        additionalInfo = [
            AdditionalInfo(title: "ქვეყანა", description: country.country),
            AdditionalInfo(title: "ახალი დადასტურებული", description: String(country.newConfirmed)),
            AdditionalInfo(title: "სულ ინფიცირებული", description: String(country.totalConfirmed)),
            AdditionalInfo(title: "ახალი გარდაცვლილი", description: String(country.newDeaths)),
            AdditionalInfo(title: "სულ გადრაცვლილი", description: String(country.totalDeaths)),
            AdditionalInfo(title: "ახალი გამოჯანმრთელებული", description: String(country.newRecovered)),
            AdditionalInfo(title: "სულ გამოჯანმრთელებული", description: String(country.totalRecovered))
        ]
        collectionView.reloadData()
    }
}

//MARK: - AdditionalInfoView API
extension AdditionalInfoView: AdditionalInfoViewApi {
    func updateView(country: Country) {
        loadViewIfNeeded()
        makeArray(with: country)
    }
}

//MARK: CollectionView delegate & dataSource
extension AdditionalInfoView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        additionalInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdditionalCell", for: indexPath) as! AdditionalCell
        cell.configure(with: additionalInfo[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 1
        let collectionViewWidth = collectionView.bounds.width - 20
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInserts = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInserts
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = 20
        return CGSize(width: width, height: height)
    }
}

// MARK: - AdditionalInfoView Viper Components API
private extension AdditionalInfoView {
    var presenter: AdditionalInfoPresenterApi {
        return _presenter as! AdditionalInfoPresenterApi
    }
    var displayData: AdditionalInfoDisplayData {
        return _displayData as! AdditionalInfoDisplayData
    }
}
