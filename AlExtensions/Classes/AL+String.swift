//
//  AL+String.swift
//  AlExtensions
//
//  Created by Soner Guler on 9.10.2019.
//

import Foundation

public extension String {

    /// Trims the string from whitespaces
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// This method checks string does contain Turkish substring or not and can be used in search cases.
    /// - Parameters:
    ///   - searchString: Search string compatible with Turkish characters
    ///   - caseSensitive: Upper or lower case sensivity
    func contains(turkishString searchString: String, caseSensitive: Bool) -> Bool {
        guard let regex = searchString.turkishRegex(caseSensitive: caseSensitive) else {
            return false
        }
        let results = regex.matches(in: self,
                                    options: [], range: NSRange(location: 0, length: self.count))
        return results.count > 0
    }
    
    /// Search Turkish characters with RegEx
    /// - Parameter caseSensitive: Upper or lower case sensivity
    func turkishRegex(caseSensitive: Bool) -> NSRegularExpression? {
        do {
            //s i o c g u
            var regexPattern = ""
            var regexCharacter = ""
            for character in self {
                regexCharacter = ""
                if character == "I" || character == "İ" || character == "ı" || character == "i" {
                    regexCharacter = "[Iİıi]"
                } else if character == "S" || character == "Ş" || character == "s" || character == "ş" {
                    regexCharacter = "[SŞsş]"
                } else if character == "O" || character == "Ö" || character == "o" || character == "ö" {
                    regexCharacter = "[OÖoö]"
                } else if character == "C" || character == "Ç" || character == "c" || character == "ç" {
                    regexCharacter = "[CÇcç]"
                } else if character == "G" || character == "Ğ" || character == "g" || character == "ğ" {
                    regexCharacter = "[GĞgğ]"
                } else if character == "U" || character == "Ü" || character == "u" || character == "ü" {
                    regexCharacter = "[UÜuü]"
                } else {
                    regexCharacter = "\(character)"
                }
                regexPattern += regexCharacter
            }

            let options: NSRegularExpression.Options = caseSensitive ? [] : [.caseInsensitive]

            return try NSRegularExpression(pattern: regexPattern, options: options)
        } catch {
            return nil
        }
    }
    
    /// Uppercased value in Turkish
    var uppercasedTurkish: String {
        return self.uppercased(with: Locale(identifier: "tr-TR"))
    }
    
    /// Url decoded string by adding **removingPercentEncoding**
    func urlDecoded() -> String? {
        return self.removingPercentEncoding
    }
    
    /// Email validation
    /// - Returns: Validation result
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Converts html content to NSAttributedString
    func html2AttributedString() -> NSAttributedString? {
        return self.data(using: .utf8)?.html2AttributedString()
    }
    
    /// Converts html content to String
    func html2String() -> String? {
        return self.html2AttributedString()?.string
    }
}
