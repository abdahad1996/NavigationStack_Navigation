//
//  Navigation.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

enum HomeDestination: Hashable {
    case schedule
    case scheduleDetail(scheduleItem: ScheduleItem)
    case mündlicheView
    case studentDetailView
    
}
class HomeNavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to destination: HomeDestination) {
        path.append(destination)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func reset() {
        path.removeLast(path.count)
    }
}
