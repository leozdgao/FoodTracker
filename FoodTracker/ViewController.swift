//
//  ViewController.swift
//  FoodTracker
//
//  Created by 高振东 on 15/12/21.
//  Copyright © 2015年 高振东. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // MARK: Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
  // MARK: Lifecycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 为输入框添加delegate
    self.nameTextField.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // 隐藏输入用键盘
    textField.resignFirstResponder()
    
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    let userInputText = textField.text!
    
    // 检查输入是否为空
    if !userInputText.isEmpty {
      // 将输入的值作为Label的Text
      self.mealNameLabel.text = textField.text
      // 重置输入框
      textField.text = ""
    }
  }
  
  // MARK: UIImagePickerControllerDelegate
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    // 改变Image Viewer的图片
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    self.photoImageView.image = selectedImage
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  // MARK: Actions
  
  @IBAction func selectPhotoFromPhotoLibrary(sender: UITapGestureRecognizer) {
    // 这里不需要出现键盘
    self.nameTextField.resignFirstResponder()
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .PhotoLibrary
    imagePickerController.delegate = self
    
    presentViewController(imagePickerController, animated: true, completion: nil)
  }
}

