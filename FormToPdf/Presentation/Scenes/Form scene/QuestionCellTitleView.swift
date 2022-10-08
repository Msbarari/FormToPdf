//
//  CustomTableCellView.swift
//  FormToPdf
//
//  Created by DG on 02/10/2022.
//

import UIKit
import RxSwift
import RxRelay

class QuestionCellTitleView: UIView {
    var answer = PublishSubject<Bool>()
    private let questionLbl : UILabel =
    {
        let lableView = UILabel()
        lableView.translatesAutoresizingMaskIntoConstraints = false
        lableView.numberOfLines = 0
        return lableView
    }()
    
    private let segment : UISegmentedControl =
    {
        let items = ["Yes", "No"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        segmentedControl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(with question: Question) {
        questionLbl.text = question.question
    }
    
    func commonInit() {
        addSubview(questionLbl)
        addSubview(segment)
        segment.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        
        setConstraints()
        
        
    }
    func setConstraints()  {
        NSLayoutConstraint.activate(
            [
                questionLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                questionLbl.trailingAnchor.constraint(equalTo: self.segment.leadingAnchor, constant: -10),
                questionLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                questionLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            ]
        )
        NSLayoutConstraint.activate(
            [
                segment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                segment.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
                segment.widthAnchor.constraint(equalToConstant: 85)
                
            ]
        )
    }
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            segmentedControl.selectedSegmentTintColor = .green
            self.answer.onNext(true)
            break
        case 1:
            segmentedControl.selectedSegmentTintColor = .red
            self.answer.onNext(false)
            break
            
        default:
            break
        }
    }
}

