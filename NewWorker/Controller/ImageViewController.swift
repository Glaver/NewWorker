//
//  ImageViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 14/2/21.
//

import UIKit

let numberOfImages = 6

protocol ImageDelegateProtocol: AnyObject {
    func choosenImageAvatarDelegate(_ imageAvatar: UIImage)
}

class ImageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var imageAvatarCollection: UICollectionView!
    weak var delegate: ImageDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAvatarCollection.dataSource = self
        imageAvatarCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = imageAvatarCollection.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCollectionViewCell {
            itemCell.imageForCell.load(url: ImageAPI.url)
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var image = UIImage(named: "blur")!
        if let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            image = cell.imageForCell.image ?? UIImage(named: "blur")!
        }
        delegate?.choosenImageAvatarDelegate(image)
        _ = self.navigationController?.popViewController(animated: true)
    }
}
