//
//  PlistService.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation

struct PlistService
{
    fileprivate var plistData : [String]?
    
    init?(_ resourceName : String)
    {
        if let infoPlistPath = Bundle.main.url(forResource: resourceName, withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                
                if let arr = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String] {
                    plistData = arr
                }
            } catch {
                return nil
            }
        }
        else{
            return nil
        }
    }
    
    func getData() -> [String]? {
        return plistData
    }
}
