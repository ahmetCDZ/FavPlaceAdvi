

import Foundation
import UIKit


class MyModel{
    
    static let sharedIns = MyModel()
    
    var placeName = ""
    var placeKind = ""
    var placeComment = ""
    var placeLat = ""
    var placelon = ""
    var placeImage = UIImage()
    
    private init () {}
    
}
