//
//  ViewController.swift
//  OpenWeather
//
//  Created by Vladimir on 30/01/2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextFiels: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func loadView() {
        super.loadView()
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func testButtonTapped(_ sender: UIButton) {
        if let login = loginTextFiels.text,
            let password = passwordTextField.text {
            print("Login \(login) and Password \(password)")
            if login == "admin", password == "pwd123" {
                print("Успешная авторизация")
            }
            else {
                print("Не самая успешная авторизация")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShown( notification: Notification ) {
        let info = notification.userInfo! as NSDictionary
        let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size

        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        self.scrollView?.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillHide( notification: Notification ) {
        scrollView.contentInset = .zero
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

