//
//  QuestionTableViewCell.swift
//  FormToPdf
//
//  Created by DG on 02/10/2022.
//

import UIKit
import RxRelay
import RxSwift
import RxCocoa

class QuestionTableViewCell: UITableViewCell {
    
    private let containerView = UIStackView()
     let cellView = QuestionCellTitleView()
     let detailView = QuestionCellDetailView()
    var viewModel : QuestionTableViewModel!
    private var disposeBag = DisposeBag()
   weak var tableView: UITableView? {
          return parentView(of: UITableView.self)
      }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(with question: Question) {
        cellView.setUI(with: question)
        detailView.setUI(with: "description",
                         image:UIImage())
//        question.isExpanded ? showDetailView() : hideDetailView()

    }
    
    func bindViewModel()
    {
        viewModel.output.question.subscribe {[weak self] question in
            self?.setUI(with: question!)
        }.disposed(by: disposeBag)
        
    }
    
    func commonInit() {
        selectionStyle = .none
        detailView.isHidden = true
        
        
        containerView.axis = .vertical
        
        contentView.addSubview(containerView)
        containerView.addArrangedSubview(cellView)
        containerView.addArrangedSubview(detailView)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.pin(to: self.contentView)
        
        
    }

}

extension QuestionTableViewCell {
    var isDetailViewHidden: Bool {
        return detailView.isHidden
    }

    func showDetailView() {
        detailView.isHidden = false
    }

    func hideDetailView() {
        detailView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isDetailViewHidden, selected {
            showDetailView()
        } else {
            hideDetailView()
        }
    }
}
