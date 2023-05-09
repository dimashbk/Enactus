//
//  LessonModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 09.05.2023.
//

import Foundation

struct LessonElement: Codable {
    let id: Int
    let lesson: String
    let typeID, dayOfWeek: Int
    let timeOfTheLesson: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, lesson
        case typeID = "type_id"
        case dayOfWeek = "day_of_week"
        case timeOfTheLesson = "time_of_the_lesson"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
