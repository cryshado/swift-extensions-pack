//
//  DateCommon.swift
//  swift-extensions-pack
//
//  Created by Oleh Hudeichuk on 2/6/19.
//

import Foundation

extension Date {

    public func dateWithTimeZone(_ dateFormatter: DateFormatter, secondsFromGMT: Int) -> Date? {
        dateFormatter.timeZone   = TimeZone.init(abbreviation: "UTC")
        let currentDate          = dateFormatter.string(from: self)
        dateFormatter.timeZone   = TimeZone(secondsFromGMT: secondsFromGMT * -1)

        return dateFormatter.date(from: currentDate)
    }
    
    public func dateWithTimeZone(dateFormat: String="dd-MM-yyyy HH:mm:ss", secondsFromGMT: Int) -> Date? {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateWithTimeZone(dateFormatter, secondsFromGMT: secondsFromGMT)
    }
    
    public func day(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "dd", secondsFromGMT: secondsFromGMT))
    }
    
    public func month(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "MM", secondsFromGMT: secondsFromGMT))
    }
    
    public func year(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "yyyy", secondsFromGMT: secondsFromGMT))
    }
    
    public func hours(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "HH", secondsFromGMT: secondsFromGMT))
    }
    
    public func minutes(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "mm", secondsFromGMT: secondsFromGMT))
    }
    
    public func seconds(secondsFromGMT: Int?=nil) -> UInt? {
        return UInt(toString(dateFormat: "ss", secondsFromGMT: secondsFromGMT))
    }

    public func toMillis() -> UInt {
        return UInt(self.timeIntervalSince1970 * 1000)
    }

    public func toSeconds() -> UInt {
        return UInt(self.timeIntervalSince1970)
    }
}
