//
//  ScheduleViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 09.05.2023.
//

import Foundation

final class ScheduleViewModel {
    
    var lessons = [LessonElement]()
    var filteredArray = [LessonElement]()
    let networkService = ENNetworkService()
    var updateViewData: (() -> ())?

    
    func getAllLessons() {
        guard let url = URL(string: "http://studc-api.kz/api/schedule/get-all") else {return}
        
        networkService.fetchData(url: url) { (result: Result<[LessonElement], Error>) in
            switch result {
            case .success(let organizations):
                self.lessons = organizations
                self.updateViewData?()
                print("yeah body: \(self.lessons)")
            case .failure(let error):
                print("skinny bitch: \(error.localizedDescription)")
            }
        }
    }
    
    func filterByWeekday(weekday: Int) {
    filteredArray = []
        lessons.forEach {
            if $0.dayOfWeek == weekday {
                filteredArray.append($0)
                print($0.lesson)
            }
        }
        updateViewData?()
    }
}
  
