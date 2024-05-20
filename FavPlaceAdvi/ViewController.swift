

import UIKit
import Firebase
import FirebaseStorage

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    @IBAction func signInButton(_ sender: Any) {
        if emailField.text != "" && passField.text != "" {
            Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!){succes,error in
                if error != nil {
                    self.makeAler(titleInput: "Hata", titleMessage: "Giriş yapılamadı. Tekrar deneyin!")
                }else{
                    self.performSegue(withIdentifier: "toVc", sender: nil)
                    print(succes?.user.displayName as Any)
                }
            }
        
        }else{
            makeAler(titleInput: "Hata", titleMessage: "Kullanıcı adı boş bırakılamaz..")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if emailField.text != "" && passField.text != "" {
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!)
            self.performSegue(withIdentifier: "toVc", sender: nil)
        
        }else{
            makeAler(titleInput: "Hata", titleMessage: "Kullanıcı adı boş bırakılamaz..")
        }
    }
    func makeAler(titleInput:String , titleMessage:String){
        let alert = UIAlertController(title: titleInput , message: titleMessage, preferredStyle: UIAlertController.Style.alert)
        let okBut = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBut)
        self.present(alert, animated: true, completion: nil)
       
    }
}

