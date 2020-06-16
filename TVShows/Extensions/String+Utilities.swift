//
//  String+Utilities.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-13.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    mutating func replaceHttpWithHttps() -> Self {
        let endIndex = self.index(self.startIndex, offsetBy: 3)
        self.replaceSubrange(self.startIndex...endIndex, with: "https")
        return self
    }
    
    private var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding:String.Encoding.utf8.rawValue,
            ], documentAttributes: nil)
            
        } catch {
            return NSAttributedString()
        }
    }
    
    private var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    //referred: https://stackoverflow.com/questions/45959903/how-to-set-font-size-on-nsattributedstring/58516503#58516503
    func convertToHTMLString() -> NSAttributedString? {
        let modifiedFontString = "<span style=\"font-family: Lato-Regular; font-size: 22; color: rgb(60, 60, 60)\">" + self + "</span>"
        return modifiedFontString.htmlToAttributedString
    }
    
    func getAttributedTextFor(label: String) -> NSAttributedString {
        let resultAttributedText = NSMutableAttributedString()
        if  !self.isEmpty {
            let font = UIFont.boldSystemFont(ofSize: 18)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.systemRed,
            ]
            let label = NSAttributedString(string: "\(label): ", attributes: attributes)
            resultAttributedText.append(label)
            resultAttributedText.append(NSAttributedString(string: self))
        }
        
        return resultAttributedText
    }
}


//MARK Date

extension String {
    func convertToTwelveHour() -> Self {
        let date = DateFormatter.twentyFourHourFormatter.date(from: self)
        let twelveHour = DateFormatter.twelveHourFormatter.string(from: date!)
        return twelveHour
    }
    
    func convertToMediumType() -> Self {
        let date = DateFormatter.standardDateFormatter.date(from: self)
        let mediumStyleDate = DateFormatter.mediumDateFormatter.string(from: date!)
        return mediumStyleDate
    }
}



