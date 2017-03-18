//
//  SignUpViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 23/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(HandleCancel))
       
        navigationItem.title = "Register"
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.red.withAlphaComponent(0.6)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red.withAlphaComponent(0.6)]
        
        
        
        self.SetBackground()
        
//        view.addSubview(inputcontainerview)
//        Setupinputconatinerview()
        
        
        view.addSubview(ScrollView)
        ScrollViewConstraints()
        
        
        // Prevent Navigation Bar form covering the view
        self.edgesForExtendedLayout = []
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
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
        scrollview.showsVerticalScrollIndicator = true
       
        return scrollview
        
    }()
    
    func ScrollViewConstraints()
    {
        ScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // ScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        ScrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2).isActive = true
//        ScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        ScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
         inputcontainerview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       // inputcontainerview.centerYAnchor.constraint(equalTo: ScrollView.centerYAnchor).isActive = true
        // inputcontainerview.widthAnchor.constraint(equalTo: ScrollView.widthAnchor, constant: -24).isActive = true
       // inputcontainerview.heightAnchor.constraint(equalTo: ScrollView.heightAnchor, constant: -24).isActive = true
        inputcontainerview.heightAnchor.constraint(equalTo: ScrollView.heightAnchor).isActive = true
        inputcontainerview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        
        inputcontainerview.addSubview(NameTextField)
        NameTextFieldConstraints()
        
        inputcontainerview.addSubview(EmailTextField)
        EmailTextFieldConstraints()
        
        inputcontainerview.addSubview(PasswordTextField)
        PasswordTextFieldConstraints()
        
        inputcontainerview.addSubview(PhoneTextField)
        PhoneTextFieldConstraints()
        
        inputcontainerview.addSubview(CityTextField)
        CityTextFieldConstraints()
        
        inputcontainerview.addSubview(ChooseBloodTypeLabel)
        ChooseBloodTypeLabelConstraints()
        
        inputcontainerview.addSubview(BloodTypeControl)
        BloodTypeSegmentConstraints()
        
        inputcontainerview.addSubview(isDonorLabel)
        isDonorLabelConstraints()
        
        inputcontainerview.addSubview(isDonorControl)
        isDonorSegmentConstraints()
       
        inputcontainerview.addSubview(RegisterButton)
        RegisterButtonConstraints()
        
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
        emailtf.autocapitalizationType = .none
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
        
        // Maintaning a gap of 15 px between Textfields of height 40 px
        EmailTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 65).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        EmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
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
        
        // Maintaning a gap of 15 px between Textfields of height 40 px
        PasswordTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 120).isActive = true
        PasswordTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        PasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    
    // Phone Number Text Field
    
    
    let PhoneTextField: UITextField = {
        let tf = UITextField()
        
        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
        tf.textColor = UIColor.white
        tf.layer.borderWidth = 1.2
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.cornerRadius = 20
        tf.layer.backgroundColor = UIColor.darkGray.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.keyboardType = UIKeyboardType.numberPad
        
        
        
        // The rounded corners were hiding the text , this block of code indents the text to the left
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        tf.leftViewMode = UITextFieldViewMode.always
        tf.leftView = spacerView
        
        
        return tf
    }()

    
    func PhoneTextFieldConstraints()
    {
        PhoneTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        
        // Maintaning a gap of 15 px between Textfields of height 40 px
        PhoneTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 175).isActive = true
        PhoneTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        PhoneTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    
    // City Text Field
    
    
    
    let CityTextField: UITextField = {
        let tf = UITextField()
        
        tf.attributedPlaceholder = NSAttributedString(string: "City", attributes: [NSForegroundColorAttributeName: UIColor.lightText])
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
    
    
    
    func CityTextFieldConstraints()
    {
        CityTextField.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        
        // Maintaning a gap of 15 px between Textfields of height 40 px
        CityTextField.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 230).isActive = true
        CityTextField.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        CityTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    // Choose Blood Type Label
    
    let ChooseBloodTypeLabel: UILabel =
    {
        let label = UILabel()
        label.text = "Choose Your Blood Type"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    func ChooseBloodTypeLabelConstraints()
    {
        ChooseBloodTypeLabel.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        ChooseBloodTypeLabel.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 280).isActive = true
        ChooseBloodTypeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ChooseBloodTypeLabel.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
    }
    
    
    
    
    // Blood Type Segmented Control
    
    let BloodTypeControl: UISegmentedControl =
    {
        let sc = UISegmentedControl(items:["A+", "A-","B+", "B-", "O+", "O-", "AB+", "AB-"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.red
       
        
        return sc
    }()
    
    
    func BloodTypeSegmentConstraints()
    {
        BloodTypeControl.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        BloodTypeControl.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 320).isActive = true
        BloodTypeControl.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        BloodTypeControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
        
    }
    
    
    
    // isDonor Label
    
    let isDonorLabel: UILabel =
        {
            let label = UILabel()
            label.text = "Are you willing to be a donor ?"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor.white
            label.textAlignment = .center
            
            
            return label
    }()
    
    
    
    func isDonorLabelConstraints()
    {
        isDonorLabel.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        isDonorLabel.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 360).isActive = true
        isDonorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        isDonorLabel.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
    }
    
    
    // isDonor Segmented Control
    
    
    let isDonorControl: UISegmentedControl =
        {
            let sc = UISegmentedControl(items:["Yes", "No"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.tintColor = UIColor.red
            
            return sc
    }()
    
    
    func isDonorSegmentConstraints()
    {
        isDonorControl.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        isDonorControl.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 400).isActive = true
        isDonorControl.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        isDonorControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    
    
    // Register User Button
    
    let RegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        // button.alpha = 0.6
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        button.addTarget(self, action: #selector(RegisterUser), for: .touchUpInside )
        
        
        return button
        
    }()
    
    
    func RegisterButtonConstraints()
    {
        RegisterButton.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        RegisterButton.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 455).isActive = true
        RegisterButton.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -80).isActive = true
        RegisterButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    
    
    
    func RegisterUser()
    {
        
        
        guard let email = EmailTextField.text,let password = PasswordTextField.text,let name = NameTextField.text,let phone = PhoneTextField.text,let city = CityTextField.text
        else
        {
            print("Form Not Valid")
            return
        }
        
        let bloodint: Int = BloodTypeControl.selectedSegmentIndex
      
        
        let bloodtype: String = BloodTypeControl.titleForSegment(at: bloodint)!
        let isdonor: Bool

        switch isDonorControl.selectedSegmentIndex
        {
        case 0:
            isdonor = true
        case 1:
            isdonor = false
        default:
            isdonor = true
            print("If you don't specify whether you want to donate or not , you will be considered a donor")
            }
        
        
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, signuperror) in
            
            
            if signuperror != nil
            {
                print(signuperror!)
                return
            }
            print("register")
            
            guard let uid = user?.uid else
            {
                return
            }
            
            let ref: FIRDatabaseReference! = FIRDatabase.database().reference()
            let UsersRef = ref.child("Users").child(uid)
            
            let users = ["Name": name,"Email": email,"Phone": phone,"City": city,"BloodType": bloodtype,"isDonor": isdonor] as [AnyHashable: Any]
                
                
            UsersRef.updateChildValues(users, withCompletionBlock: { (databaseerror, ref) in
                
                if databaseerror != nil
                {
                    print(databaseerror!)
                    return
                }
                
                print("Saved User Successfully")
                
                
                self.ShowHomeScreen()
                
            })
        })
    }
    
    func ShowHomeScreen()
    {
        let Homeviewcontroller = HomeViewController()
         let Homeviewwithnavigation = UINavigationController(rootViewController: Homeviewcontroller)
         self.present(Homeviewwithnavigation, animated: true, completion: nil)
       // navigationController?.pushViewController(Homeviewcontroller, animated: true)
    }
    
//    func keyboardWillShow(_ notification:Notification)
//    {
//        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
//        var userInfo = notification.userInfo!
//        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
//        
//        var contentInset:UIEdgeInsets = self.ScrollView.contentInset
//        contentInset.bottom = keyboardFrame.size.height + 20
//        self.ScrollView.contentInset = contentInset
//    }
//    
//    func keyboardWillHide(_ notification:Notification)
//    {
//        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
//        self.ScrollView.contentInset = contentInset
//    }
//    
//   
    
    
    
    
    
    
    func HandleCancel()
    {
        
        let LoginController = LoginViewController()
//        let LoginControllerwithNaviagtion = UINavigationController(rootViewController: LoginController)
        
        
        present(LoginController, animated: true, completion: nil)
        
    }
}
