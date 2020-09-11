//
//  MainView.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit
import Network

//MARK: MainView Class
final class MainView: HomeViewController {
    
    //MARK: class Variables
    var countries: [Country] = []
   
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setupNavigation()
        checkNetworkConnection()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(countries, forKey: "SavedLastInfo")
        print("shenaxulia -> \(countries)")
    }
    
    
    //MARK: View Setup
    func configureCollectionView() {        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: "MainCell")
    }
    
    func setupNavigation() {
        navigationItem.title = "Covid19"
        self.navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.4392156863, green: 0.3882352941, blue: 0.9176470588, alpha: 1)
    }
    
    func checkNetworkConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
            } else {
                DispatchQueue.main.async {
                    self.presenter.didGetConnectionError()
                    
//                    print("There's no internet connection.")
                    let defaults = UserDefaults.standard
                    self.countries = defaults.array(forKey: "SavedLastInfo")  as? [Country] ?? [Country]()
                    self.collectionView.reloadData()
                }
            }
        }
        monitor.start(queue: queue)
    }
}

//MARK: - MainView API
extension MainView: MainViewApi {
    func updateData(with summary: Summary) {
        self.stopLoading()
        self.countries = summary.Countries
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
        cell.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.1215686275, blue: 0.2392156863, alpha: 1)
        cell.configure(with: countries[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInserts = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInserts
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapCollectionViewItem(country: countries[indexPath.row])
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
