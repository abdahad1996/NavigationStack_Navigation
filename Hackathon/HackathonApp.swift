//
//  HackathonApp.swift
//  Hackathon
//
//  Created by macbook abdul on 11/06/2024.
//

import SwiftUI

@main
struct HackathonApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}


 





// HomeView with a list of lessons
//struct HomeView: View {
//    @StateObject var viewModel = HomeViewModel()
//
////    let lessons = [
////        Lesson(title: "Geographie 4B", date: "Fr 20.04.2020", startTime: "8:00", endTime: "8:50"),
////        Lesson(title: "Englisch 4A", date: "Fr 20.04.2020", startTime: "10:05", endTime: "10:55"),
////        Lesson(title: "Geographie 4C", date: "Fr 20.04.2020", startTime: "12:05", endTime: "12:55"),
////        Lesson(title: "Englisch 4D", date: "Fr 20.04.2020", startTime: "13:55", endTime: "14:45")
////    ]
////    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 0) {
//                TopBarView()
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 16) {
//                        SectionHeaderView(title: "Kalender")
//                            NavigationLink(destination: DetailView()) {
////                                LessonRowView(lesson: lesson)
//                                ScheduleListView(items: viewModel.items)
//
//                            
//                            .buttonStyle(PlainButtonStyle()) // Removes the default link style
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarTitle("Home", displayMode: .inline)
//            .navigationBarHidden(true)
//        }
//    }
//}




 

// Components for HomeView
//struct LessonRowView: View {
//    let lesson: Lesson
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 4) {
//                Text(lesson.title)
//                    .font(.headline)
//                Text(lesson.date)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            Spacer()
//            VStack(alignment: .trailing, spacing: 4) {
//                Text("\(lesson.startTime) - \(lesson.endTime)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//        .background(Color(UIColor.systemGray6))
//        .cornerRadius(8)
//    }
//}

// Top bar view
//struct TopBarView: View {
//    var body: some View {
//        HStack {
//            Text("08:30")
//                .font(.system(size: 24, weight: .bold))
//            Spacer()
//            Button(action: {
//                // Action for back button
//            }) {
//                HStack {
//                    Image(systemName: "chevron.left")
//                    Text("KALENDER")
//                }
//            }
//            Spacer()
//            Image(systemName: "calendar")
//                .font(.system(size: 24))
//        }
//        .padding()
//        .background(Color.green)
//        .foregroundColor(.white)
//    }
//}

// Detail components
//struct TitleView: View {
//    let lesson: Lesson
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            Text(lesson.title)
//                .font(.system(size: 24, weight: .bold))
//            Text(lesson.date)
//                .font(.system(size: 18))
//                .foregroundColor(.gray)
//        }
//    }
//}

//struct ThemeView: View {
//    let theme: String
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            Text("Thema:")
//                .font(.system(size: 18))
//                .foregroundColor(.gray)
//            Text(theme)
//                .font(.system(size: 18, weight: .bold))
//                .padding()
//                .background(Color(UIColor.systemGray6))
//                .cornerRadius(8)
//        }
//    }
//}

//struct SectionHeaderView: View {
//    let title: String
//    
//    var body: some View {
//        Text(title)
//            .font(.system(size: 18, weight: .bold))
//            .foregroundColor(.black)
//    }
//}
