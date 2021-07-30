//
//  ImageCollectionViewController.swift
//  TagsyInClass
//
//  Created by APPLE on 2021/01/26.
//

import UIKit

private let reuseIdentifier = "imageCell"

class ImageCollectionViewController: UICollectionViewController {
    
    let imagePicker = UIImagePickerController()
    var uploadedImages:[UploadedImage] = []
    var imageLoaderViewController: ImageLoaderViewController?
    
    
    @IBAction func tappedPlusButton(_ sender: UIBarButtonItem) {
        // open the user's device photo library
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return uploadedImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // programmatically create a UIImageView
           let imageview: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
           imageview.image = uploadedImages[indexPath.row].image

           // add the UIImageView to the cell
           cell.contentView.addSubview(imageview)
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let loaderNC = segue.destination as? UINavigationController,
              let loaderVC = loaderNC.topViewController as? ImageLoaderViewController else {return}
        imageLoaderViewController = loaderVC
        imageLoaderViewController?.delegate = self
        loaderVC.uploadedImage = uploadedImages.last
        return
    }
    
    
}
