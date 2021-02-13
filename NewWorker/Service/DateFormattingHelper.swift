//
//  DateFormattingHelper.swift
//  NewWorker
//
//  Created by Vladyslav on 13/2/21.
//

import Foundation

class DateFormattingHelper {

    static let shared = DateFormattingHelper()

    let yearMonthDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    func printFormattedDate(_ date: Date, printFormat: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = printFormat
        return dateFormat.string(from: date)
    }
}
