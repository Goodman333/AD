//
//  TabFirstViewController.swift
//  AD
//
//  Created by 佳哥无敌啦 on 2020/9/5.
//  Copyright © 2020 佳哥无敌啦. All rights reserved.
//

import UIKit
import Kingfisher

class TabFirstViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        adModel.rows?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageUrl = URL(string: adModel.rows?[indexPath.row].image ?? "")
        cell.imageView?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "sss"), completionHandler: { (result) in
            switch result {
            case .success(let value):
                print("Task done for: \(value.image)")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        })
        cell.textLabel?.text = adModel.rows?[indexPath.row].title
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let videoURL = URL(string: adModel.rows?[indexPath.row].url ?? "")
        let controller = ADDetailViewController(ADVideoURL: videoURL, ADImageURL: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}
