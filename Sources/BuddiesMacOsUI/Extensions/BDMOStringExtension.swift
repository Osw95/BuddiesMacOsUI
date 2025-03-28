//
//  BDMOStringExtension.swift
//  BuddiesMacOsUI
//
//  Created by Javier Cruz Santiago on 09/01/25.
//

import Foundation

public enum SSUStringError: String, Error {
    case cantGetNumberFromCurrencyFormattedString
    case cantGetDateFromMonthYearBasedId
    case cantGetDateFromMonthDayBasedId
}

public extension String {
    /**
     Returns a `NSNumber` from localized currency formatted `String`.
     
     This functions localize the current `String` using the `Locale` class and extract the amount number using the `NumberFormatter` class.
     
     __Usage Example__
     
     ```swift
     let mxnCurrencyString = "$10,000.00"
     let number = mxnCurrencyString.amount()
     ```
     
     - Returns: `NSNumber` that represents te numeric value for a currency formatted `String`.
     - Throws: `SSUStringError`
     */
    func amount() throws -> NSNumber {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        guard let number = formatter.number(from: self) else {
            throw SSUStringError.cantGetNumberFromCurrencyFormattedString
        }
        return number
    }
    
    /**
     Returns a `Date` from a `String` that represents a `MonthYearBasedId`.
     
     This functions takes the current `String` and validate if it is a valid `MonthYearBasedId` in order to return the `Date` for that id.
     
     __Usage Example__
     
     ```swift
     let stringDateId = "202410" // October 2024
     let date = try? stringDateId.dateFromMonthYearBasedId()
     ```
     
     - Returns: `Date` that represents month year based date for a `MonthYearBasedId`..
     - Throws: `SSUStringError`
     */
    
    func localizedCurrencyFormatted() -> String? {
        let clear = clearedFromCurrencySymbols()
        guard let atLeastTrheeDigits = clear.atLeastThreeDigits(),
              let withDecimalDot = atLeastTrheeDigits.withDecimalDot(),
              let doubleValue = Double(withDecimalDot) else { return nil }
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: doubleValue))
    }
    
    func currencySymbol() -> String? {
        let pattern = "[\\p{Sc}]"
        let matches = self.matches(for: pattern)
        
        return matches.count == 1 ? matches.first : nil
    }
    
    func matches(for regex: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: regex) else { return [] }
        let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
        return results.map { String(self[Range($0.range, in: self)!]) }
    }
    
    func clearedFromCurrencySymbols() -> String {
        var cleared = replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ".", with: "")
        if let currencySymbol = cleared.currencySymbol() {
            cleared = cleared.replacingOccurrences(of: currencySymbol, with: "")
        }
        return cleared
    }
    
    func atLeastThreeDigits() -> String? {
        let cleared = clearedFromCurrencySymbols()
        guard cleared.count < 3 else { return cleared }
        let zeros = Array(repeating: "0", count: 3 - cleared.count).joined(separator: "")
        return "\(zeros)\(cleared)"
    }
    
    func withDecimalDot() -> String? {
        guard count >= 3 else { return nil }
        var formatted = self
        formatted.insert(".", at: formatted.index(formatted.endIndex, offsetBy: -2))
        return formatted
    }
}
