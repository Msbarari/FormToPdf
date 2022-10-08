//
//  QuestionPlistRepository.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation


struct QuestionLocalRepository : QuestionRepository
{
    func getSurvey() -> Survey {
        return UserDefaults.standard.codableObject(dataType: Survey.self, key: "Survey")!
    }
    
    func updateSurvey(_ survay: Survey) {
        UserDefaults.standard.setCodableObject(survay, forKey: "Survey")
    }

}
