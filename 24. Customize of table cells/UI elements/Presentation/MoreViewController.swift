//
//  MoreViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        tableView.register(UINib(nibName: "SomwXibCell", bundle: nil), forCellReuseIdentifier: "SomwXibCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MoreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getUniqueSideNumber()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return model.getHeroesNumber()
        case 1: return model.getVillainNumber()
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SomwXibCell", for: indexPath) as! SomeTableViewCell
        let characters: [Character] = model.characters.filter { character in
            character.side.rawValue == indexPath.section
        }
        cell.configure(name: characters[indexPath.row].name, description: characters[indexPath.row].description, photoName: characters[indexPath.row].photoName)
        return cell
    }
}

extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Heroes"
        } else if section == 1 {
            return "Villains"
        } else {
            return "Others"
        }
    }
}
