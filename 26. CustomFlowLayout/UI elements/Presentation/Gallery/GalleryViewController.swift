//
//  ControlsViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionGallery: UICollectionView!
    
    let model = GalleryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionGallery.dataSource = self
    }

}

extension GalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeCollectionViewCell", for: indexPath) as! SomeCollectionViewCell
        cell.someImageView.image = model.images[indexPath.row]
        cell.likeView.configure(isLike: false, likeCount: model.likes[indexPath.row])
        return cell
    }
}

