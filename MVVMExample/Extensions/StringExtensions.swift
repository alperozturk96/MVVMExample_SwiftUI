//
//  StringExtensions.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_doesntExists")
    }
    
    func argLocalized(_ placeholder: String) -> String {
       return String(format: placeholder.localized, self)
    }
   
    func localized(_ args: [CVarArg]) -> String { return String(format: localized, args) }
    func localized(_ args: CVarArg...) -> String { return String(format: localized, args) }
}
