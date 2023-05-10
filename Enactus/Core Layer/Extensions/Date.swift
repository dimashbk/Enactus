//
//  Date.swift
//  Enactus
//
//  Created by Dinmukhamed on 09.05.2023.
//

import Foundation

extension Date {

    var calendar: Calendar { Calendar.current }

    var weekday: Int {
        (calendar.component(.weekday, from: self) - calendar.firstWeekday + 7) % 7 + 1
    }
}
