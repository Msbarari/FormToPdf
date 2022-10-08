//
//  QuestionTableViewModel.swift
//  FormToPdf
//
//  Created by DG on 06/10/2022.
//

import Foundation
import RxRelay

struct QuestionTableViewModel
{
    
    struct Output {
        var question = BehaviorRelay<Question?>(value: nil)
        
    }
    var output = Output()
    
    init(question : Question) {
        self.output.question.accept(question)
    }
    
}
