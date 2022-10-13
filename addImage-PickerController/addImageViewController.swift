//
//  addImageViewController.swift
//  addImage-PickerController
//
//  Created by Buğra Özuğurlu on 12.10.2022.
//

import UIKit
 

class addImageViewController: UIViewController {
    
    
    
    let addPhotoButton : UIButton = {
       
        let photoButton = UIButton()
        
        photoButton.setImage(UIImage(named: "image"), for: UIControl.State.normal)
        
        photoButton.addTarget(self, action: #selector(addPhotoWhenUserPressed), for: UIControl.Event.touchUpInside)
        
        return photoButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        view.backgroundColor = .systemBackground
        
        
    }
    
    // Fotoğraf galerisine ulaşma
    
    @objc private func addPhotoWhenUserPressed() {
        
        
        
        let pickerController = UIImagePickerController()
        present(pickerController, animated: true)
        
        // Seçilen fotoğrafı görüntüleyebilmek için
        pickerController.delegate = self
        
        
        
    }
    
    func setupButton() {
        
        view.addSubview(addPhotoButton)
        
        //addPhotoButton.frame = CGRect(x: screenWidth/2, y: screenHeight/2, width: 300, height: 300)
        
        addPhotoButton.frame = CGRect(x: 125, y: 150, width:150, height:150)
        
    }

}

extension addImageViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //Cancel butonu oluşturma
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    //Kullanıcının seçtiği fotoğrafa ulaşma
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[.originalImage] as? UIImage
        self.addPhotoButton.setImage(selectedImage, for: UIControl.State.normal)
        //Görüntünün yuvarlak hale gelmesi
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        //Sınırların kaldırılması
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.layer.borderColor = UIColor.black.cgColor
        addPhotoButton.layer.borderWidth = 4
        //Fotoğrafı seçtikten sonra ekranı kapat
        dismiss(animated: true)
    }
}
