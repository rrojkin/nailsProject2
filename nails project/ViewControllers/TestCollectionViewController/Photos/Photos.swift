//
//  Photos.swift
//  nails project
//
//  Created by Antony Razhnou on 4/18/22.
//

import UIKit

struct Photo {
//  var caption: String
//  var comment: String
  var image: UIImage
  
  init(image: UIImage) {
//    self.caption = caption
//    self.comment = comment
    self.image = image
  }
  
  init?(dictionary: [String: String]) {
    guard
//      let caption = dictionary["Caption"],
//      let comment = dictionary["Comment"],
      let photo = dictionary["Photo"],
      let image = UIImage(named: photo)
      else {
        return nil
    }
    self.init(image: image)
  }

  static func allPhotos() -> [Photo] {
    var photos: [Photo] = []
    guard
      let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
      let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]]
      else {
        return photos
    }
    for dictionary in photosFromPlist {
      if let photo = Photo(dictionary: dictionary) {
        photos.append(photo)
      }
    }
    return photos
  }
}
