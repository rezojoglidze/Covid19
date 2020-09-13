//
//  MainView.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit

//MARK: MainView Class
final class MainView: HomeViewController {
    
    //MARK: class Variables
    var countries: [Country] = []
   
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var lastActivityErrorView: UIView!
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    //MARK: IBActions
    @IBAction func refreshBtnTapped(_ sender: Any) {
        self.startLoading()
        lastActivityErrorView.isHidden = true
        presenter.didTapRefreshBtn()
    }
    
    //MARK: View Setup
    func configureCollectionView() {        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: "MainCell")
    }
    
    func setupNavigation() {
        navigationItem.title = "Covid19"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.4392156863, green: 0.3882352941, blue: 0.9176470588, alpha: 1)
    }
    
    func configureLastActivityEmptyView() {
        refreshBtn.setTitle("დარეფრეშება".uppercased(), for: .normal)
        lastActivityErrorView.isHidden = false
    }
}

//MARK: - MainView API
extension MainView: MainViewApi {
    func updateData(with summary: Summary) {
        self.stopLoading()
        self.countries = summary.countries
        UserDefaults.standard.setStructArray(summary.countries, forKey: Constants.Keys.lastAcitivtyDate)
        collectionView.reloadData()
    }
    
    func showLastActivity(isEmpty: Bool) {
        self.stopLoading()
        isEmpty ? configureLastActivityEmptyView() : (self.countries = UserDefaults.standard.structArrayData(Country.self, forKey: Constants.Keys.lastAcitivtyDate))
        collectionView.reloadData()
    }
}

//MARK: CollectionView delegate & dataSource
extension MainView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.configure(with: countries[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.orientation.isLandscape {
            let (width,height) = configureCollectionView(columns: 2, layout: collectionViewLayout)
            return CGSize(width: width , height: height)
        } else {
            let (width,height) = configureCollectionView(columns: 1, layout: collectionViewLayout)
            return CGSize(width: width , height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapCollectionViewItem(country: countries[indexPath.row])
    }
    
    func configureCollectionView(columns: CGFloat, layout collectionViewLayout: UICollectionViewLayout) -> (width: CGFloat, height: CGFloat) {
        let columns: CGFloat = columns
        let collectionViewWidth = collectionView.bounds.width - 10
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInserts = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInserts
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = 100
        return (width, height)
    }
}

// MARK: - MainView Viper Components API
private extension MainView {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
    var displayData: MainDisplayData {
        return _displayData as! MainDisplayData
    }
}
