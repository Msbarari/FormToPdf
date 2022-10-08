//
//  QuestionCellDetailView.swift
//  FormToPdf
//
//  Created by DG on 08/10/2022.
//

import Foundation
import UIKit

class QuestionCellDetailView: UIView, UITextViewDelegate {
    
    private let descriptionTxt : UITextView =
    {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.isEditable = true
        textView.text = "Placeholder"
        textView.textColor = UIColor.lightGray
        textView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    private let gallaryButton : UIButton =
    {
        let button = UIButton()
        button.setImage(UIImage(systemName: "folder"), for: .normal)
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
        return button
    }()
    
    private let cameraButton : UIButton =
    {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return button
    }()
    
    private let collectionView : UICollectionView =
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let stackView : UIStackView =
    {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .gray
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI(with string: String, image: UIImage) {
        //        descriptionTxt.text = "Detail View for Cell \(string)"
    }
    
    func commonInit() {
        addSubview(descriptionTxt)
        addSubview(stackView)
        stackView.addArrangedSubview(cameraButton)
        stackView.addArrangedSubview(gallaryButton)
        stackView.addArrangedSubview(collectionView)
        descriptionTxt.delegate = self
        setConstraints()
        
    }
    
    func setConstraints()  {
        NSLayoutConstraint.activate(
            [
                descriptionTxt.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                descriptionTxt.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                descriptionTxt.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                descriptionTxt.heightAnchor.constraint(equalToConstant: 200)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: self.descriptionTxt.bottomAnchor, constant: 10),
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                stackView.heightAnchor.constraint(equalToConstant: 100)
            ]
        )
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
}

