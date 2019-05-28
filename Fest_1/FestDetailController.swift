//
//  FestDetailController.swift
//  Fest_1
//
//  Created by A.S.D.Vinay on 02/02/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit

class FestDetailController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var imageOfFest:String?
    
    var fest: Fest?{
        didSet{
            navigationItem.title = fest?.name
            if let name = fest?.festBannerImageName {
            self.imageOfFest = name
            }else{
                if let name = fest?.imageName{
                    self.imageOfFest = name
                }
            }
        }
    }
    
    var aboutLabel:String?

    var bannerCategories: [FestCategory]?
    private let headerId = "headerId"
    private let descriptionID = "descriptionID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsVerticalScrollIndicator = false
        bannerCategories = FestCategory.sampleFestBannerCategories(FestImageName: self.imageOfFest!)
        collectionView?.register(FestDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(FestDetailDescription.self, forCellWithReuseIdentifier: descriptionID)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! FestDetailHeader
        
        header.festCategory = bannerCategories?[indexPath.item]
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionID, for: indexPath) as! FestDetailDescription
        cell.fest = fest
        cell.descView.text = fest?.desc
        return cell
    }
   


    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height-280)
    
    }
}

class FestDetailHeader: Header {
    
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(dividerLineView)
        appsCollectionView.register(FestBannerCell.self, forCellWithReuseIdentifier: cellId)
        appsCollectionView.backgroundColor = UIColor.white
        
        
        
        addConstraintsWithFormat("H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat("V:[v0(1)]|", views: dividerLineView)
        
        
    }
     class FestBannerCell:FestCell{
        override func setupViews() {
            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            imageView.layer.borderWidth = 0
            imageView.layer.cornerRadius = 0
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            
            addConstraintsWithFormat("H:|[v0]|", views: imageView)
            addConstraintsWithFormat("V:|[v0]|", views: imageView)
            
        }

    }
    
    
}

class FestDetailDescription: BaseCell {
    
    var fest:Fest?
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Description", "Rules", "Discussions"])
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let labelTitleView:UILabel = {
        let ltv = UILabel()
        ltv.text = "About The Event"
        ltv.font = UIFont.systemFont(ofSize: 14)
        return ltv
    }()
    
    let descView:UILabel = {
        let dv = UILabel()
        dv.font = UIFont.systemFont(ofSize: 11)
        dv.textColor = UIColor.darkGray
        dv.numberOfLines = 30
        return dv
    }()
    
    func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        if sender.selectedSegmentIndex == 0{
            labelTitleView.text = "About The Event"
            descView.text = fest?.desc
        }
        if sender.selectedSegmentIndex == 1{
            labelTitleView.text = "Rules"
            descView.text = fest?.rules
        }
        if sender.selectedSegmentIndex == 2{
            labelTitleView.text = "Discussions"
        }
    }
    
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(labelTitleView)
        addSubview(descView)
        addSubview(segmentedControl)
       
        segmentedControl.addTarget(self, action: #selector(FestDetailDescription.segmentedValueChanged(_:)), for: .valueChanged)
        
        addConstraintsWithFormat("H:|-40-[v0]-40-|", views: segmentedControl)
        
        addConstraintsWithFormat("H:|-14-[v0]|", views: labelTitleView)
        
        addConstraintsWithFormat("V:|-14-[v0(34)]-14-[v1]-14-[v2]", views: segmentedControl,labelTitleView,descView)
        
        addConstraintsWithFormat("H:|-14-[v0]-14-|", views: descView)

    }
}

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

