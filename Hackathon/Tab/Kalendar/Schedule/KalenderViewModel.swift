//
//  KalenderViewModel.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI


class KalenderViewModel: ObservableObject {
    @Published var items: [ScheduleItem] = [
        ScheduleItem(subject: "Geographie 4B", time: "8:00 - 8:50", icon: "globe", color: .blue),
        ScheduleItem(subject: "Englisch 4A", time: "10:05 - 10:55", icon: "envelope", color: .yellow),
        ScheduleItem(subject: "Geographie 4C", time: "12:05 - 12:55", icon: "globe", color: .red),
        ScheduleItem(subject: "Geographie 4B", time: "13:00 - 13:50", icon: "globe", color: .blue),
        ScheduleItem(subject: "Englisch 4D", time: "13:55 - 14:45", icon: "bubble.left", color: .purple)
    ]
}
