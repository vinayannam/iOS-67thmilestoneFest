//
//  CategoryCell.swift
//  Fest_1
//
//  Created by A.S.D.Vinay on 01/02/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var featuredEventsController:FeaturedAppsController?
    
    
    var festCategory: FestCategory? {
        didSet {
            if let name = festCategory?.name{
                nameLabel.text = name
            }
            appsCollectionView.reloadData()
        }
    }


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let appsCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let cellId = "appCellId"
    
    let dividerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews(){
        addSubview(appsCollectionView)
        addSubview(dividerView)
        addSubview(nameLabel)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.showsHorizontalScrollIndicator = false
        appsCollectionView.register(FestCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView ,"v1": dividerView,"v2":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = festCategory?.fests?.count{
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FestCell
        cell.fest = festCategory?.fests?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height-32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let fest = festCategory?.fests?[indexPath.item]{
        
        featuredEventsController?.showFestDetailsforFest(fest: fest)
            
        }
    }
    
}

class FestCell:UICollectionViewCell{
    
    var fest: Fest? {
        didSet {
            if let name = fest?.name{
                nameLabel.text = name
            }
            if let category = fest?.category{
                categoryLabel.text = category
            }
            if let imageName = fest?.imageName{
                imageView.image = UIImage(named:imageName)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true 
        return iv
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    
    func setupViews(){
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 0, y: frame.width+2, width: frame.width, height: 40)
        addSubview(categoryLabel)
        categoryLabel.frame = CGRect(x: 0, y: frame.width+42, width: frame.width, height: 15)
    }
}


