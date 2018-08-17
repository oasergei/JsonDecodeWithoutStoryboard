//
//  DetailViewController.swift
//  JsonTableView
//
//  Created by Sergey on 17.08.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.borderWidth = 1
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
//        label.backgroundColor = UIColor.red
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let dobLabel: UILabel = {
        let label = UILabel()
        label.text = "Date: "
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
//        label.backgroundColor = UIColor.green
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country: "
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
//        label.backgroundColor = UIColor.green
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height: "
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        //        label.backgroundColor = UIColor.green
        label.textColor = UIColor.darkGray
        return label
    }()
    
    var actor: Actor? {
        didSet {
            navigationItem.title = actor?.name
            nameLabel.text = nameLabel.text! + (actor?.name)!
            dobLabel.text = dobLabel.text! + (actor?.dob)!
            
            if let image = URL(string: (actor?.image)!) {
                pictureImageView.load(url: image)
            }
            
            countryLabel.text = countryLabel.text! + (actor?.country)!
            heightLabel.text = heightLabel.text! + (actor?.height)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationControllerSetup()
    }
    
//    override func updateViewConstraints() {
//
//        super.updateViewConstraints()
//    }
    
//    override func viewWillLayoutSubviews() {
//
//    }
    
    func navigationControllerSetup() {
        //navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    func setup() {
        view.backgroundColor = UIColor(r: 245, g: 245, b: 245)
//        view.frame.origin.y = (navigationController?.navigationBar.frame.size.height)!
        view.addSubview(detailView)
        detailView.addSubview(pictureImageView)
        detailView.addSubview(nameLabel)
        detailView.addSubview(dobLabel)
        detailView.addSubview(countryLabel)
        detailView.addSubview(heightLabel)
        
//        navigationController?.navigationBar.frame.size.height
        
        detailView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 48, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)

        pictureImageView.setAnchor(top: detailView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 120, height: 120)
        pictureImageView.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        
        nameLabel.setAnchor(top: pictureImageView.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 15)
        
        dobLabel.setAnchor(top: nameLabel.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 15)
        
        countryLabel.setAnchor(top: dobLabel.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 15)
        
        heightLabel.setAnchor(top: countryLabel.bottomAnchor, left: detailView.leftAnchor, bottom: nil, right: detailView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 15)
        
    }
    
}

















