//
//  QuestionRepository.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation

protocol QuestionRepository
{
    func getSurvey() -> Survey
    func updateSurvey(_ survay : Survey) 
}
