//
//  MoreViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
}

extension MoreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as! SomeTableViewCell
        cell.labelName.text = model.characters[indexPath.row].name
        cell.labelDescription.text = model.characters[indexPath.row].description
        cell.imageView?.image = UIImage(named: model.characters[indexPath.row].photoName)
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    
}
