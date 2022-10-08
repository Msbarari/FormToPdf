//
//  GenerateQuestionsUseCase.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation

struct GenerateQuestionsUseCase
{
    var plistService : PlistService
    
    init(plistService : PlistService) {
        self.plistService = plistService
    }
    
    func excute()  {
        
        guard (UserDefaults.standard.codableObject(dataType: Survey.self, key: "Survey") == nil) else {
            return
        }
        
        guard let plistData = plistService.getData()  else {
            return
        }
        
        
        var survay = Survey(name: "Vehicle Survey", questions: [])
        
        for (index,ques) in plistData.enumerated() {
            survay.questions.append(Question(id: index, question: ques, description: nil, answer: nil, imageUrl: nil,isExpanded: true))
        }
        
        UserDefaults.standard.setCodableObject(survay, forKey: "Survey")
    }
    
}
