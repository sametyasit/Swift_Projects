//
//  DetailsViewController.swift
//  AlisverisListesi
//
//  Created by Samet on 20.08.2024.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var kaydetButton: UIButton!
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var PriceTextField: UITextField!
    @IBOutlet weak var SizeTextField: UITextField!
    
    var secilenUrunIsmi = ""
    var secilenUrunId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if secilenUrunIsmi != "" {
            //Core data şeçilen urun bilgilerini göster
            
            kaydetButton.isHidden = true
            
            
            if let uuidString = secilenUrunId?.uuidString{
              
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do{
                    let sonuclar  =  try context.fetch(fetchRequest)
                    
                    if sonuclar.count > 0 {
                        
                        for sonuc in sonuclar as! [NSManagedObject] {
                            
                            if let isim  = sonuc.value(forKey: "isim" ) as? String {
                                NameTextField.text = isim
                            }
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int{
                                PriceTextField.text = String(fiyat)
                            }
                            if let beden = sonuc.value(forKey: "beden") as? String{
                                SizeTextField.text = beden
                            }
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data{
                                let image = UIImage(data: gorselData)
                                imageView.image = image
                            }
                            
                        }
                    }
                } catch {
                    print("Hata var.")
                }
                
                
            }
        }else{
            kaydetButton.isHidden = false
            kaydetButton.isEnabled = false
            NameTextField.text = ""
            SizeTextField.text = ""
            PriceTextField.text = ""
            
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
        
    }
    
    @objc func gorselSec(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        kaydetButton.isEnabled = true 
        self.dismiss(animated:  true, completion: nil)
        
    }
    @objc func klavyeyiKapat(){
        view.endEditing(true)
    }
    
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(NameTextField.text!, forKey: "isim")
        alisveris.setValue(SizeTextField.text!, forKey: "beden")
        
        if let fiyat  = Int(PriceTextField.text!){
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        
        do{
            try context.save()
            print("Kayıt edildi.")
        } catch {
            print("Hata var.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
     
        
    }
}
