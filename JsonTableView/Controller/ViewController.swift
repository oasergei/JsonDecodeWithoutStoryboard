//
//  ViewController.swift
//  JsonTableView
//
//  Created by Sergey on 16.08.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stringURL = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    
    var contentArray = [Actor]()
    
    var contentTableView: UITableView = {
        var tv = UITableView()
        tv.separatorStyle = .none
        //tv.allowsSelection = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableViewSetup()
        getJSONContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationControllerSetup()
    }

    func navigationControllerSetup() {
        navigationItem.title = "Json data"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func tableViewSetup() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
        contentTableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.cellID)
        view.addSubview(contentTableView)
        contentTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    func getJSONContent() {
        let downloadUrl = URL(string: stringURL)
        guard let url = downloadUrl else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data, responce != nil, error == nil else {
                print("something is wrong")
                return
            }
            
            do {
                let decoderData = try JSONDecoder().decode(Actors.self, from: data)
                self.contentArray = decoderData.actors
                
                DispatchQueue.main.async {
                    self.contentTableView.reloadData()
                }
                
            } catch let err {
                print("error getJSONContent is \(err)")
            }
            
        }.resume()
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.cellID, for: indexPath) as! ContentCell
        
        cell.titleLabel.text = contentArray[indexPath.row].name
        cell.dobLabel.text = contentArray[indexPath.row].dob
        
        if let urlImage = URL(string: contentArray[indexPath.row].image) {
            cell.pictureImageView.load(url: urlImage)
        }
        
//        if let imageURL = URL(string: contentArray[indexPath.row].image) {
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: imageURL)
//                if let data = data {
//                    let image = UIImage(data: data)
//                    DispatchQueue.main.async {
//                        cell.pictureImageView.image = image
//                    }
//                }
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actor = contentArray[indexPath.row]
        let detailVC = DetailViewController()
        
        detailVC.actor = actor
        navigationController?.pushViewController(detailVC, animated: true)
    }
 
}
















