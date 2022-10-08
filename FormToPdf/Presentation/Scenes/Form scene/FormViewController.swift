//
//  ViewController.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class FormViewController: UIViewController {
    
    weak var coordinator : MainCoordinator?
    var generateQuestionUseCase : GenerateQuestionsUseCase!
    var viewModel : FormViewModel!
    var disposeBag = DisposeBag()
    
    private let tableView : UITableView =
    {
        let tableView = UITableView()
        tableView.register(QuestionTableViewCell.self,
                           forCellReuseIdentifier: "QuestionTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 85
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        generateQuestionUseCase.excute()
        
        configureTableView()
        bindViewModel()
        viewModel.fetchQuestions()
        
    }
    
    func bindViewModel()  {
        self.viewModel.output.questions.bind(to: tableView.rx.items(cellIdentifier: "QuestionTableViewCell", cellType: QuestionTableViewCell.self))
        {index, question, cell in
            
            cell.viewModel = QuestionTableViewModel(question: question)
            cell.bindViewModel()
//            
            cell.cellView.answer.subscribe(onNext: { value in
                guard !value,cell.isDetailViewHidden else {return}
                
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                
                
                self.tableView.delegate?.tableView!(self.tableView, didSelectRowAt: indexPath)
            },onDisposed: nil).disposed(by: self.disposeBag)

            
        }.disposed(by: disposeBag)
    }
    
    func answerChanged(_ index : Int, _ value : Bool)  {
        if(!value)
        {
            self.tableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .none)
        }
    }
    
    func configureTableView() {
        
        self.view.addSubview(tableView)
        self.tableView.pin(to: self.view)
        self.tableView.delegate = self
    }
    
    
}

extension FormViewController : UITableViewDelegate
{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         UIView.animate(withDuration: 0.3) {
             self.tableView.performBatchUpdates(nil)
         }
     }
     
     
     
//      func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
////         if let cell = self.tableView.cellForRow(at: indexPath) as? QuestionTableViewCell {
////             cell.hideDetailView()
////         }
//     }
    
    
}

