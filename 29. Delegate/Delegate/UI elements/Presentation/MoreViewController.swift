//
//  MoreViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var model = Model()
    var filteredModel = Model(initWithoutCharacters: true)
    private var selectedName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SomwXibCell", bundle: nil), forCellReuseIdentifier: "SomwXibCell")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        filteredModel = model
    }
    
    @IBAction func addRow(_ sender: UIButton) {
        guard !model.charactersToAdd.isEmpty else { return }
        
        let deletedElement = model.charactersToAdd.removeFirst()
        
        model.characters.append(deletedElement)
        filteredModel = model
        
        let numberOfSections = filteredModel.getUniqueSideNumber()
        let indexSet = IndexSet(integer: numberOfSections - 1)
        let row: Int = getRowNumber(deletedElement)
        
        tableView.performBatchUpdates {
            if tableView.numberOfSections < numberOfSections {
                tableView.insertSections(indexSet, with: .none)
            }
            
            tableView.insertRows(at: [IndexPath(row: row, section: deletedElement.side.rawValue)], with: .automatic)
        } completion: { [self] _ in
            tableView.scrollToRow(at: IndexPath(row: row, section: deletedElement.side.rawValue), at: .bottom, animated: true)
        }
    }
}

extension MoreViewController {
    func getRowNumber(_ character: Character) -> Int {
        filteredModel.getSideCharactersNumber(character.side.rawValue) - 1
    }
}

extension MoreViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredModel = searchText.isEmpty ? model : filter(searchText)
        tableView.reloadData()
    }
    
    func filter(_ searchText: String) -> Model {
        let filteredCharacters = model.characters.filter({$0.name.lowercased().contains(searchText.lowercased())})
        let result = Model(characters: filteredCharacters)
        return result
    }
}

extension MoreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getUniqueSideNumber()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredModel.getSideCharactersNumber(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SomwXibCell", for: indexPath) as! SomeTableViewCell
        let characters: [Character] = filteredModel.characters.filter { character in
            character.side.rawValue == indexPath.section
        }
        cell.configure(name: characters[indexPath.row].name, description: characters[indexPath.row].description, photoName: characters[indexPath.row].photoName)
        cell.delegate = self
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

extension MoreViewController: SomeTableViewCellDelegate {
    func cellDidTap(name: String) {
        print("Ячейка была нажата, а само нажатие было обработано в контроллере")
        selectedName = name
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

extension MoreViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDetail":
            guard let detailVC = segue.destination as? DetailViewController else { return }
            let character: [Character] = (selectedName.isEmpty ? model : filter(selectedName)).characters
            detailVC.labelName = character[0].name
            detailVC.photoName = character[0].photoName
            detailVC.labelDescription = character[0].description
        default:
            break
        }
    }
}
