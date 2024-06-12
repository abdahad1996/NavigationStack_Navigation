//
//  Kalender.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationManager: HomeNavigationManager
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
            VStack(spacing: 0) {
                TopBarView()
                DateNavigationView()
                ScheduleListView(items: viewModel.items) { schedule in
                    navigationManager.navigate(to: .scheduleDetail(scheduleItem: schedule))
                }
            }
        
    }
}
