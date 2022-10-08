//
//  Question.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation

struct Question : Codable
{
    var id : Int
    var question : String
    var description : String?
    var answer : Bool?
    var imageUrl : [URL]?
    var isExpanded: Bool 
    
}
