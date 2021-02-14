//
//  ImageViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 14/2/21.
//

import UIKit

protocol ImageDelegateProtocol: AnyObject {
    func choosenImageAvatarDelegate(_ imageAvatar: UIImage)
}

class ImageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var imageAvatarCollection: UICollectionView!
    var collectionImages = [UIImage]()
    weak var delegate: ImageDelegateProtocol?
    let numberOfImages = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for _ in 0...numberOfImages {
//           // DispatchQueue.main.async {
//                let imageAvatar = UIImageView()
//                imageAvatar.load(url: ImageAPI.url)
//                self.collectionImages.append(imageAvatar.image ?? UIImage(named: "blur")!)
//            //}
//        }
        imageAvatarCollection.dataSource = self
        imageAvatarCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = imageAvatarCollection.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCollectionViewCell {
            itemCell.imageForCell.load(url: ImageAPI.url)
            collectionImages.append(itemCell.imageForCell.image ?? UIImage(named: "blur")!)
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageAvatar = collectionImages[indexPath.row]
        delegate?.choosenImageAvatarDelegate(imageAvatar)
        _ = self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
}
