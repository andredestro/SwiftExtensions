//
//  UIViewController.swift
//  Extensions
//
//  Created by André Felipe Destro on 01/08/16.
//  Copyright (c) 2016 André Felipe Destro. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    func addNotificationObserver(_ name: String, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    func removeNotificationObserver(_ name: String) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addKeyboardWillShowNotification() {
        self.addNotificationObserver(NSNotification.Name.UIKeyboardWillShow.rawValue, selector: #selector(UIViewController.keyboardWillShowNotification(_:)));
    }
    
    func addKeyboardDidShowNotification() {
        self.addNotificationObserver(NSNotification.Name.UIKeyboardDidShow.rawValue, selector: #selector(UIViewController.keyboardDidShowNotification(_:)));
    }
    
    func addKeyboardWillHideNotification() {
        self.addNotificationObserver(NSNotification.Name.UIKeyboardWillHide.rawValue, selector: #selector(UIViewController.keyboardWillHideNotification(_:)));
    }
    
    func addKeyboardDidHideNotification() {
        self.addNotificationObserver(NSNotification.Name.UIKeyboardDidHide.rawValue, selector: #selector(UIViewController.keyboardDidHideNotification(_:)));
    }
    
    func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(NSNotification.Name.UIKeyboardWillShow.rawValue);
    }
    
    func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(NSNotification.Name.UIKeyboardDidShow.rawValue);
    }
    
    func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(NSNotification.Name.UIKeyboardWillHide.rawValue);
    }
    
    func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(NSNotification.Name.UIKeyboardDidHide.rawValue);
    }
    
    @objc fileprivate func keyboardDidShowNotification(_ notification: Notification) {
        keyboardDidShowWithFrame(keyboardFrameEndUserFromNotification(notification))
    }
    
    @objc fileprivate func keyboardWillShowNotification(_ notification: Notification) {
        keyboardWillShowWithFrame(keyboardFrameEndUserFromNotification(notification))
    }
    
    @objc fileprivate func keyboardWillHideNotification(_ notification: Notification) {
        keyboardWillHideWithFrame(keyboardFrameEndUserFromNotification(notification))
    }
    
    @objc fileprivate func keyboardDidHideNotification(_ notification: Notification) {
        keyboardDidHideWithFrame(keyboardFrameEndUserFromNotification(notification))
    }
    
    fileprivate func keyboardFrameEndUserFromNotification(_ notification: Notification) -> CGRect {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        return (value?.cgRectValue)!
    }
    
    func keyboardWillShowWithFrame(_ frame: CGRect) {
        print("keyboardWillShowWithFrame is not implemented")
    }
    
    func keyboardDidShowWithFrame(_ frame: CGRect) {
        print("keyboardDidShowWithFrame is not implemented")
    }
    
    func keyboardWillHideWithFrame(_ frame: CGRect) {
        print("keyboardWillHideWithFrame is not implemented")
    }
    
    func keyboardDidHideWithFrame(_ frame: CGRect) {
        print("keyboardDidHideWithFrame is not implemented")
    }
}
