//
//  ViewController.swift
//  ImagePicker
//
//  Created by Laxman on 13/05/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIAlertViewDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet var btnClickMe: UIButton!
    
    
    @IBOutlet var imageView: UIImageView!
    
    var picker : UIImagePickerController? = UIImagePickerController()
    var popover : UIPopoverController? =  nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        picker?.delegate = self
        
        btnClickMe.layer.cornerRadius = 4.0
        
        imageView.layer.cornerRadius = 10.0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseImageButton(sender: AnyObject) {
    
        var alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openCamera()
                
        }
        var gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openGallary()
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
            {
                UIAlertAction in
                
        }
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the actionsheet
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: alert)
            popover!.presentPopoverFromRect(btnClickMe.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }

  
    
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self .presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            openGallary()
        }
    }
    func openGallary()
    {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: picker!)
            popover!.presentPopoverFromRect(btnClickMe.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }
  
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        picker .dismissViewControllerAnimated(true, completion: nil)
        imageView.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        //sets the selected image to image view
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        println("picker cancel.")
    }
    
    
}

