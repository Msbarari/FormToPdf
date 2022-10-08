//
//  UIView.swift
//  FormToPdf
//
//  Created by DG on 02/10/2022.
//

import Foundation
import UIKit

extension UIView
{
     func pin(to superView : UIView)  {
         
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
         
    }
    func pin(to superView : UIView, top : CGFloat, leading : CGFloat, trialing : CGFloat, bottom : CGFloat )  {
        
       translatesAutoresizingMaskIntoConstraints = false
       topAnchor.constraint(equalTo: superView.topAnchor,constant: top).isActive = true
       bottomAnchor.constraint(equalTo: superView.bottomAnchor,constant: bottom).isActive = true
       leadingAnchor.constraint(equalTo: superView.leadingAnchor,constant: leading).isActive = true
       trailingAnchor.constraint(equalTo: superView.trailingAnchor,constant: trialing).isActive = true
        
   }
    
    
        func parentView<T: UIView>(of type: T.Type) -> T? {
            guard let view = superview else {
                return nil
            }
            return (view as? T) ?? view.parentView(of: T.self)
        }
    
}
