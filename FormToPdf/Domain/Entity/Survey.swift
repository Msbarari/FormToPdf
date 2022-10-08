//
//  Survey.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation

struct Survey : Codable
{
    var name : String
    var questions : [Question]
}
