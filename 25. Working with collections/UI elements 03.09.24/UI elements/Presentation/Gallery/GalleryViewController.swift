//
//  ControlsViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionGallery: UICollectionView!
    
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionGallery.dataSource = self
    }

}

extension GalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.getUniqueSideNumber()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return model.getHeroesNumber()
        case 1: return model.getVillainNumber()
        case 2: return model.getOthersNumber()
        default: break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeCollectionViewCell", for: indexPath) as! SomeCollectionViewCell
        let characters: [Character] = model.characters.filter { character in
            character.side.rawValue == indexPath.section
        }
        cell.someImageView.image = UIImage(named: characters[indexPath.row].photoName)
        
        return cell
    }
    
    
}
