//
//  MainTabView.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

// MainTabView with TabView
struct MainTabView: View {
    @StateObject private var homeNavigationManager = HomeNavigationManager()

    var body: some View {
        TabView {
            NavigationStack(path: $homeNavigationManager.path) {
                            HomeView()
                                .navigationDestination(for: HomeDestination.self) { destination in
                                    switch destination {
                                    case .schedule:
                                        HomeView()
                                    case .scheduleDetail(let scheduleItem):
                                        ScheduleDetailView(scheduleItem: scheduleItem)
                                    case .mündlicheView:
                                        MündlicheView()
                                    case .studentDetailView:
                                        StudentDetailView()
                                    }
                                }
                        }.environmentObject(homeNavigationManager)
                .tabItem {
                    Label("Kalender", systemImage: "calendar")
                }
            LeistungView()
                .tabItem {
                    Label("Leistung", systemImage: "paintbrush")
                }
            VerwaltungView()
                .tabItem {
                    Label("Verwaltung", systemImage: "doc.text")
                }
            ProfilView()
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
    }
}


