

protocol ImageLoaderViewControllerDelegate {
    func dismiss()
    func addUploadedImage(uploadedImage: UploadedImage)
}

// ImageCollectionViewController conforms to the protocol
// we created above, which means it needs to implement
// the dismiss() and addUploadedImage(...) methods
extension ImageCollectionViewController: ImageLoaderViewControllerDelegate {

    func dismiss() {
        guard let imageLoaderVC = imageLoaderViewController else { return }
        imageLoaderVC.dismiss(animated: true, completion: nil)
    }

    func addUploadedImage(uploadedImage: UploadedImage) {
        // get the index of the uploaded image that matches the one
        // we received from the ImageLoaderViewController
        let index = uploadedImages.firstIndex { uploaded -> Bool in
            uploaded.image == uploadedImage.image
        }

        // if we find an index
        if let i = index {
            // save the uploaded image to our uploadedImages array
            // at the index we found
            uploadedImages[i] = uploadedImage
        }
    }
}
