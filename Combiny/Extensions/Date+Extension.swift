//
//  Date+Extension.swift
//  Happy Lingo 2
//
//  Created by Johandre Delgado  on 05.04.2020.
//  Copyright © 2020 Johandre Delgado . All rights reserved.
//

import Foundation


extension Date {
    
    var shortDateString: String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
    
    
    var mediumDateString: String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .medium
        return formatter1.string(from: self)
    }
    
    
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    
    var dayOfWeekShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    
    var asKey: String {
        return shortDateString
    }
    
    
    func addTodate(_ amount: Int, _ component: Calendar.Component) -> Date {
        return Calendar.current.date(byAdding: component, value: amount, to: self) ?? self
    }
    
}


extension Date {
    func timeAgo() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day

        if secondsAgo < 5 {
            return "Just now"
        } else if secondsAgo < minute {
            return "\(secondsAgo) second\(secondsAgo == 1 ? "" : "s") ago"
        } else if secondsAgo < hour {
            let minutes = secondsAgo / minute
            return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
        } else if secondsAgo < day {
            let hours = secondsAgo / hour
            return "\(hours) hour\(hours == 1 ? "" : "s") ago"
        } else if secondsAgo < week {
            let days = secondsAgo / day
            return "\(days) day\(days == 1 ? "" : "s") ago"
        }

        return "Some time ago" // TODO: better return the short date here.
    }
}
