import UIKit
import SwiftUI


public struct ImageHandler {
    
    public private(set) var text = "Hello, Very Pretty World!"

    public init() {
    }
    
    static public var defaultImage:Image {
        if let uiImage = ImageHandler.generateBlankImage(color: .blue) {
            return Image(uiImage: uiImage)
        } else {
        return Image("photo")
        }
    }
    
    static private func generateBlankImage(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
