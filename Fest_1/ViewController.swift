//
//  ViewController.swift
//  Fest_1
//
//  Created by A.S.D.Vinay on 31/01/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    
    
    var festCategories: [FestCategory]?
    var bannerCategories: [FestCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Events"
        
        collectionView?.backgroundColor = UIColor.white
        
        festCategories = FestCategory.sampleFestCategories()
        bannerCategories = FestCategory.sampleBannerCategories()
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showFestDetailsforFest(fest: Fest){
        let layout = UICollectionViewFlowLayout()
        let appDetailController = FestDetailController(collectionViewLayout: layout)
        appDetailController.fest = fest
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.festCategory = festCategories?[indexPath.item]
        cell.featuredEventsController = self 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = festCategories?.count{
            return count
        }
       return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        
        header.festCategory = bannerCategories?[indexPath.item]
        
        return header
    }


}

class Header:CategoryCell{
    let cellId = "bannerCellId"
    var pageControl: UIPageControl?
    var begin = false
    
    override func setupViews() {
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.showsHorizontalScrollIndicator = false
        
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: cellId)
        
        startTimer()
        
        addSubview(appsCollectionView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FestCell
        cell.fest = festCategory?.fests?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width , height: frame.height)
    }
    
    
    
    func scrollToNextCell(){
        
        //get cell size
        let cellSize = CGSize(width: frame.width, height:frame.height);
        
        //get current content Offset of the Collection view
        let contentOffset = appsCollectionView.contentOffset;
        
        if appsCollectionView.contentSize.width <= appsCollectionView.contentOffset.x + cellSize.width
        {
            appsCollectionView.scrollRectToVisible(CGRect(x:0, y:contentOffset.y, width:cellSize.width+10, height:cellSize.height), animated: true);
            
            
        } else {
            appsCollectionView.scrollRectToVisible(CGRect(x:contentOffset.x + cellSize.width, y:contentOffset.y, width:cellSize.width+10, height:cellSize.height), animated: true);
        }
        
    }
    
    func startTimer() {
        
        Timer.scheduledTimer(timeInterval:3.0, target: self, selector: #selector(Header.scrollToNextCell), userInfo: nil, repeats: true);
    
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // If the scroll animation ended, update the page control to reflect the current page we are on
        
        let count = self.festCategory?.fests?.count
        
        pageControl?.currentPage = Int((appsCollectionView.contentOffset.x / appsCollectionView.contentSize.width) * CGFloat(count!))

        
        
        if appsCollectionView.contentSize.width == appsCollectionView.contentOffset.x + frame.width
        {
            begin = true
            
        }
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        // Called when manually setting contentOffset
        scrollViewDidEndDecelerating(scrollView: scrollView)
        
    }

    
    
     class BannerCell: FestCell {
         override func setupViews() {
            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            imageView.layer.borderWidth = 0
            imageView.layer.cornerRadius = 0
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
            
        }
    }

}



