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
        
        getRandomPhotosNSURL(count: 2) { model in
            print("NSURLSession")
            print("\(model)")
            print("--- --- ---")
        }
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
        cell.delegate = self
        return cell
    }
    
    func getRandomPhotosNSURL(count: Int, completion: @escaping ([ResponseModel]?) -> Void) {
        var components = URLComponents()
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let apiKey = "NAnmY4AT9el6_Dkq8mx-Y7TsWzCaP_J7dsNsNDtfqW8"
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = [
            URLQueryItem(name: "count", value: "\(count)"),
            URLQueryItem(name: "client_id", value: "\(apiKey)")
        ]
        
        let task = session.dataTask(with: URLRequest(url: components.url!)) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let model = try JSONDecoder().decode([ResponseModel].self, from: data)
                completion(model)
            } catch {
                completion(nil)
                debugPrint("decoding ERROR")
            }
        }
        task.resume()
    }
}

extension GalleryViewController: SomeCollectionViewCellDelegate {
    func cellDidTap() {
        print("Ячейка была нажата, а само нажатие было обработано в контроллере")
    }
}
