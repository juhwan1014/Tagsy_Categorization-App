


import UIKit

struct UploadedImage {
    var id: String? //from upload to imagga
    var image: UIImage //selected by user from device photo library
    var tags: [String] //from tags call to imagga
    var colors: [ImageColor] //from colors call to imagga
}
