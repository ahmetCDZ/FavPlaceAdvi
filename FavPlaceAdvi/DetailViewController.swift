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
    @objc func choosePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageV.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextBut(_ sender: Any) {
        let mymodel = MyModel.sharedIns
        mymodel.placeName = nameTf.text!
        
        
        self.performSegue(withIdentifier: "toMapVc", sender: nil)
    }
    
}
