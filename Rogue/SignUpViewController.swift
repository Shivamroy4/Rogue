//
//  SignUpViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 23/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(HandleCancel))
       
        
        
        self.SetBackground()
        
        view.addSubview(ScrollView)
        ScrollViewConstraints()
        
        
        // Prevent Navigation Bar form covering the view
        self.edgesForExtendedLayout = []
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    // Scroll View
    
    let ScrollView: UIScrollView =
    {
        let scrollview = UIScrollView()
        scrollview.isScrollEnabled = true
        scrollview.alwaysBounceVertical = true
        scrollview.keyboardDismissMode = .onDrag
        scrollview.showsVerticalScrollIndicator = true
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
        
    }()
    
    func ScrollViewConstraints()
    {
        ScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        ScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        ScrollView.addSubview(inputcontainerview)
        Setupinputconatinerview()
        
    }
    
    
    
    // Input Container View
    
    
    let inputcontainerview : UIView =
        {
            
            let view = UIView()
            view.backgroundColor = UIColor.black
            view.alpha = 0.6
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            
            return view
    }()

    
    func Setupinputconatinerview()
    {
        inputcontainerview.centerXAnchor.constraint(equalTo: ScrollView.centerXAnchor).isActive = true
        inputcontainerview.centerYAnchor.constraint(equalTo: ScrollView.centerYAnchor).isActive = true
        inputcontainerview.widthAnchor.constraint(equalTo: ScrollView.widthAnchor, constant: -24).isActive = true
        inputcontainerview.heightAnchor.constraint(equalTo: ScrollView.heightAnchor, constant: -24).isActive = true
        
        
        inputcontainerview.addSubview(EmailTextField)
        EmailTextFieldConstraints()
        
        
        inputcontainerview.addSubview(NameTextField)
        NameTextFieldConstraints()
    }
    
    
    // Name Text Field
    
    
    let NameTextField: UITextField = {
        let tf = UITextField()
        
        tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        tf.textColor = UIColor.white
        tf.layer.borderWidth = 1.2
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 20
        tf.layer.backgroundColor = UIColor.darkGray.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        
        // The rounded corners were hiding the text , this block of code indents the text to the left
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        tf.leftViewMode = UITextFieldViewMode.always
        tf.leftView = spacerView
        
        
        return tf
    }()
    
    func NameTextFieldConstraints()
    {
        NameTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        NameTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 10).isActive = true
        NameTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        NameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }

    
    
    
    
    
    // Email UserID Text Field
    
    let EmailTextField: UITextField = {
        let emailtf = UITextField()
        
        emailtf.attributedPlaceholder = NSAttributedString(string: "User E Mail", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        emailtf.textColor = UIColor.white
        emailtf.layer.borderWidth = 1.2
        emailtf.layer.borderColor = UIColor.white.cgColor
        emailtf.layer.cornerRadius = 20
        emailtf.layer.backgroundColor = UIColor.darkGray.cgColor
        emailtf.translatesAutoresizingMaskIntoConstraints = false
        emailtf.autocorrectionType = .no
        
        // The rounded corners were hiding the text , this block of code indents the text to the left
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        emailtf.leftViewMode = UITextFieldViewMode.always
        emailtf.leftView = spacerView
        
        
        return emailtf
    }()
    
    func EmailTextFieldConstraints()
    {
        EmailTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        EmailTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 60).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        EmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func keyboardWillShow(notification:NSNotification)
    {
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.ScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        self.ScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.ScrollView.contentInset = contentInset
    }
    
   
    
    
    
    
    
    
    func HandleCancel()
    {
        let LoginController = LoginViewController()
//        let LoginControllerwithNaviagtion = UINavigationController(rootViewController: LoginController)
        present(LoginController, animated: true, completion: nil)
        
    }
}
