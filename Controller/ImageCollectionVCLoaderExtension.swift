

extension ImageCollectionViewController: ImageLoaderViewControllerDelegete{
    func dissmiss(){
        guard let imageLoaderVC = imageLoaderViewController else {return}
        imageLoaderVC.dismiss(animated: true, completion: nil)
    }
    
    func addUploadedImage(addUploadedImage: UploadedImage){
        let index = uploadedImages.fisrtIndex{
            uploaded -> Bool in uploaded.image == uploadedImage.image
        }
        
        
        if let i = index {
            uploadedImages[i] = uploadedImage
        }
        
        
    }
}
