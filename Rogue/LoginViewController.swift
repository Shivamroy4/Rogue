//
//  LoginViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 21/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
        override func viewDidLoad()
        
        {
        super.viewDidLoad()
        
           
//            navigationItem.title = "Rouge"
//            navigationController?.navigationBar.barTintColor = UIColor.red.withAlphaComponent(0.3)
//            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
//            
            
       self.SetBackground()
       self.DismissKeyboard()
  
            
            
//        view.addSubview(theScrollView)
//            theScrollViewConstraints()
//
    
            
            view.addSubview(LogoImageView)
            LogoImageViewConstraints()
            
            view.addSubview(inputcontainerview)
            Setupinputconatinerview()
            
            view.addSubview(LoginButton)
            LoginButtonConstraints()
            
            
            view.addSubview(SignUpButton)
            SignUpButtonConstraints()
        
            
           

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
            
        
        }
    
    
 

       
    
    // Set Light Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    
    
    
    // Logo Image View
    
    let LogoImageView: UIImageView =
    {
        let logo = UIImageView()
        logo.image = UIImage(named: "bloodlogo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.alpha = 0.8
        logo.contentMode = .scaleAspectFill
        return logo
        
    }()
    
    func LogoImageViewConstraints()
    {
        LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LogoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        LogoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        LogoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
      
    }
    
    
    
    
    
    
    // Semi transparent view holder for Login screen text fields
    
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
        inputcontainerview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputcontainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputcontainerview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputcontainerview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        
        inputcontainerview.addSubview(EmailTextField)
        EmailTextFieldConstraints()
        
        inputcontainerview.addSubview(PasswordTextField)
        PasswordTextFieldConstraints()
        
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
        emailtf.keyboardType = UIKeyboardType.emailAddress
        
        // The rounded corners were hiding the text , this block of code indents the text to the left
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        emailtf.leftViewMode = UITextFieldViewMode.always
        emailtf.leftView = spacerView
        
        
        return emailtf
    }()
    
    func EmailTextFieldConstraints()
    {
        EmailTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        EmailTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 20).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        EmailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        

    }
   
    
    
    
    
    
    
    
    // Password Text Field
    
    let PasswordTextField: UITextField = {
        let pwtf = UITextField()
        
        
        pwtf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        pwtf.textColor = UIColor.white
        pwtf.isSecureTextEntry = true
        pwtf.layer.borderWidth = 1.2
        pwtf.layer.borderColor = UIColor.white.cgColor
        pwtf.layer.cornerRadius = 20
        pwtf.layer.backgroundColor = UIColor.darkGray.cgColor
        pwtf.translatesAutoresizingMaskIntoConstraints = false
        
        
        // The rounded corners were hiding the text , this block of code indents the text to the left
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        pwtf.leftViewMode = UITextFieldViewMode.always
        pwtf.leftView = spacerView
        
        
        return pwtf
    }()

  
    func PasswordTextFieldConstraints()
    {
        PasswordTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
      PasswordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor, constant: 16).isActive = true
        PasswordTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        PasswordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }

    
    
    
    
    
    
    // Login Button
    
    let LoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        //button.setBackgroundImage(UIImage.init(named: "red-bg"), for: .normal)
        button.alpha = 0.6
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(2), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
        
    }()
    
    func LoginButtonConstraints()
    {
        LoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LoginButton.topAnchor.constraint(equalTo: inputcontainerview.bottomAnchor, constant: 12).isActive = true
        LoginButton.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor).isActive = true
        LoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
    
    
    
    
    
    
    
    // SignUp Button
    
    let SignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        button.alpha = 0.6
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        button.setTitle("New User? Sign Up", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        button.addTarget(self, action: #selector(OpenSignUpScreen), for: .touchUpInside )
        
        
        return button
        
    }()
    
    func SignUpButtonConstraints()
    {
        SignUpButton.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        SignUpButton.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 12).isActive = true
        SignUpButton.widthAnchor.constraint(equalTo: EmailTextField.widthAnchor).isActive = true
        SignUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
    func OpenSignUpScreen()
    {
        let SignUpController = SignUpViewController()
        let SignUpControllerwithNavigation = UINavigationController(rootViewController: SignUpController)
        present(SignUpControllerwithNavigation, animated: true, completion: nil)
        
        
    }
    
   
    
    
    
    
    
    func keyboardWillShow()
    {
        inputcontainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        LogoImageView.isHidden = true
    }

    
    func keyboardWillHide()
    {
        inputcontainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        LogoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        LogoImageView.isHidden = false
    }
    
    

 
    
    
//    let theScrollView: UIScrollView = {
//        let scrollview = UIScrollView()
//        scrollview.layer.masksToBounds = true
//        scrollview.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        return scrollview
//    }()
//    
//    
//    func theScrollViewConstraints()
//    {
//        
//        theScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        theScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        theScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        theScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        
//        
//        
//        theScrollView.addSubview(LogoImageView)
//        LogoImageViewConstraints()
//        
//        theScrollView.addSubview(inputcontainerview)
//        Setupinputconatinerview()
//        
//        theScrollView.addSubview(LoginButton)
//        LoginButtonConstraints()
//        
//        
//        theScrollView.addSubview(SignUpButton)
//        SignUpButtonConstraints()
//    }
//   
//    
//    
//    
//    
//    func keyboardWillShow(notification:NSNotification){
//        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
//        var userInfo = notification.userInfo!
//        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
//        
//        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
//        contentInset.bottom = keyboardFrame.size.height
//        self.theScrollView.contentInset = contentInset
//    }
//    
//    func keyboardWillHide(notification:NSNotification){
//        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
//        self.theScrollView.contentInset = contentInset
//    }
    
}
