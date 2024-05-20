

import Foundation
import UIKit
class MyModel{
    
    static let sharedIns = MyModel()
    
    var placeName = ""
    var placeKind = ""
    var placeComment = ""
    var placeImage = UIImage()
    
    private init () {}
    
}
