//
//  Date+Format.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

extension Date {
    func humanFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ddMMyyyy", options: 0, locale: Locale.current)
        return dateFormatter.string(from: self)
    }
    
    static func from(seconds: Int64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(seconds))
    }
}
