//
//  FormViewModel.swift
//  FormToPdf
//
//  Created by DG on 06/10/2022.
//

import Foundation
import RxSwift
import RxRelay

class FormViewModel
{
    struct Input {

    }

    struct Output {
        var isLoading = BehaviorRelay(value: false)
        var  questions  = BehaviorRelay<[Question]>(value: [])
        let isLoadingSpinnerAvaliable = PublishSubject<Bool>()

    }


    var repository : QuestionRepository
    weak var coordinator: MainCoordinator?
    var disposeBag  = DisposeBag()
    var input : Input = Input()
    var output = Output()
    var survey : Survey?


    init(repository : QuestionRepository) {
        self.repository = repository
    }


    func fetchQuestions() {
        
        self.output.isLoadingSpinnerAvaliable.onNext(true)
        DispatchQueue.global(qos: .userInitiated).async {
            self.survey = self.repository.getSurvey()
            self.output.questions.accept(self.survey!.questions)
            self.output.isLoadingSpinnerAvaliable.onNext(false)
        }
    }
    
    func updateQuestions() {

        self.output.isLoadingSpinnerAvaliable.onNext(true)
        DispatchQueue.global(qos: .userInitiated).async {
            self.survey?.questions = self.output.questions.value
            self.repository.updateSurvey(self.survey!)
            self.output.isLoadingSpinnerAvaliable.onNext(false)
        }
    }
}
