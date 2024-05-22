//
//  DetailViewController.swift
//  FavPlaceAdvi
//
//  Created by Ahmet Zincir on 20.05.2024.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var kindsTf: UITextField!
    @IBOutlet weak var commentTf: UITextField!
    @IBOutlet weak var imageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageV.isUserInteractionEnabled = true
        let gestRec = UITapGestureRecognizer(target: self, action: #selector(choosePhoto))
        imageV.addGestureRecognizer(gestRec)
    }
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageV.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextBut(_ sender: Any) {
        if nameTf.text != "" && kindsTf.text != "" && commentTf.text != "" {
            if let choosenImage = imageV.image {
                let mymodel = MyModel.sharedIns
                mymodel.placeName = nameTf.text!
                mymodel.placeKind = kindsTf.text!
                mymodel.placeComment = commentTf.text!
                mymodel.placeImage = choosenImage
            }
            self.performSegue(withIdentifier: "toMapVc", sender: nil)
        }else{
            let alert = UIAlertController(title: "Hata", message: "Bir hata oluştu", preferredStyle: UIAlertController.Style.alert)
            let okBut = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okBut)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func choosePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
}
