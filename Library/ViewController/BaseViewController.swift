//
//  BaseViewController.swift
//  sample
//
//  Created by odc on 10/08/2017.
//  Copyright © 2017 Haroun Smida. All rights reserved.
//

import UIKit

enum ContentType {
    case DefaultContentType
    case AuthenticationContentType
    
}

enum SegueType {
    case PushSegueType
    case ModalSegueType
}

class BaseViewController: UIViewController {
    
    var contentType: ContentType?
    var segueType: SegueType?
    // var data: Any?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
/// MARK: ProgressView 
    
    func showProgressDialog() {
        self.showProgressDialog(view: self.view)
    }
    
    func showProgressDialog(view: UIView) {
        let hud = MBProgressHUD.init(view: view);
        hud.removeFromSuperViewOnHide = true
        view.addSubview(hud)
        hud.show(animated: true)
    }
    
    func hideProgressDialog() {
        let subviewsEnum = self.view.subviews.reversed()
        for item in subviewsEnum {
            if item is MBProgressHUD {
                let hud = item as! MBProgressHUD
                hud.hide(animated: true)
            }
        }
    }
    
    
/// MARK: Activity Indicator
    
    func showActivityIndicator(view: UIView) {
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge);
        activityIndicator.color = UIColor.black
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        view.addSubview(activityIndicator)
        view.bringSubview(toFront: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(view: UIView) {
        let subviewsEnum = self.view.subviews.reversed()
        for item in subviewsEnum {
            if item is UIActivityIndicatorView {
                let hud = item as! UIActivityIndicatorView
                hud.removeFromSuperview()
            }
        }
    }
    

    

}
