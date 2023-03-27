//
//  Coordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation


protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinate: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
