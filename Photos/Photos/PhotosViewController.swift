//
//  ViewController.swift
//  Photos
//
//  Created by 刘洋 on 7/6/19.
//  Copyright © 2019 Yang Liu. All rights reserved.
//

import UIKit


class PhotosViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func importImage(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true, completion: nil)
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
        let photo = UIImagePickerController()
        photo.delegate = self
        
        photo.sourceType = UIImagePickerControllerSourceType.camera
        
        photo.allowsEditing = false
        
        self.present(photo, animated: true, completion: nil)
    }
        else {
             NotifyUser(message: "This device does not have a camera.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myimage.image = photo
        }
        else {
             NotifyUser(message: "The image was not imported successfully!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func NotifyUser(message: String) {
        let jinggao = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        jinggao.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) {
            (alertAction) -> Void in
            print("OK selected")
        })
        
        self.present(jinggao, animated: true, completion: nil)
    }
    
}











