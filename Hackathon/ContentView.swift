//
//  ContentView.swift
//  Hackathon
//
//  Created by macbook abdul on 11/06/2024.
//

import SwiftUI

//import SwiftUI
//
struct ScheduleItem: Identifiable,Hashable {
    let id = UUID()
    let subject: String
    let time: String
    let icon: String
    let color: Color
}

class ViewModel: ObservableObject {
    @Published var items: [ScheduleItem] = [
        ScheduleItem(subject: "Geographie 4B", time: "8:00 - 8:50", icon: "globe", color: .blue),
        ScheduleItem(subject: "Englisch 4A", time: "10:05 - 10:55", icon: "envelope", color: .yellow),
        ScheduleItem(subject: "Geographie 4C", time: "12:05 - 12:55", icon: "globe", color: .red),
        ScheduleItem(subject: "Geographie 4B", time: "13:00 - 13:50", icon: "globe", color: .blue),
        ScheduleItem(subject: "Englisch 4D", time: "13:55 - 14:45", icon: "bubble.left", color: .purple)
    ]
}


import SwiftUI



struct TopBarView: View {
    var body: some View {
        HStack {
            Text("08:30")
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Text("Kalender")
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Image(systemName: "calendar")
                .font(.system(size: 24))
        }
        .padding()
        .background(Color.green)
        .foregroundColor(.white)
    }
}

struct DateNavigationView: View {
    var body: some View {
        HStack {
            Text("Do")
                .font(.system(size: 18))
                .foregroundColor(.gray)
            Spacer()
            Text("Fr")
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Text("Mo")
                .font(.system(size: 18))
                .foregroundColor(.gray)
        }
        .padding([.horizontal, .top])
    }
}

struct ScheduleListView: View {
    let items: [ScheduleItem]
    let onSelect : (ScheduleItem) -> Void
    
    var body: some View {
        List {
            ForEach(items,id: \.id) { item in
                HStack {
                    Text(item.subject)
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Text(item.time)
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    onSelect(item)
                }
                .padding()
                .background(item.color.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct BottomNavigationView: View {
    var body: some View {
        HStack {
            BottomNavigationItemView(icon: "calendar", label: "Kalender")
            Spacer()
            BottomNavigationItemView(icon: "paintbrush", label: "Leistung")
            Spacer()
            BottomNavigationItemView(icon: "doc.text", label: "Verwaltung")
            Spacer()
            BottomNavigationItemView(icon: "person", label: "Profil")
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}

struct BottomNavigationItemView: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(label)
                .font(.system(size: 12))
        }
        .foregroundColor(.gray)
    }
}


//#Preview {
//    ContentView()
//}


import SwiftUI

struct TaskItem: Identifiable {
    let id = UUID()
    let category: String
    let detail: String?
    let icon: String
    let color: Color
    let values: [String]
}


import SwiftUI

class AViewModel: ObservableObject {
    @Published var taskItems: [TaskItem] = [
        TaskItem(category: "Anwesenheit", detail: nil, icon: "person.3", color: .yellow, values: ["0", "0", "0", "7"]),
        TaskItem(category: "Hausübungen", detail: nil, icon: "book", color: .red, values: ["0", "0", "2", "0", "5"]),
        TaskItem(category: "Mündliche Mitarbeit", detail: nil, icon: "text.bubble", color: .purple, values: ["1", "0", "0", "6"]),
        TaskItem(category: "Referate", detail: "Erika Musterfrau", icon: "mic", color: .green, values: []),
        TaskItem(category: "Schriftliche Wiederholungen", detail: "E-Vokabeltest", icon: "pencil", color: .green, values: [])
    ]
}

import SwiftUI

struct AContentView: View {
    @StateObject var viewModel = AViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ATopBarView()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    TitleView()
                    ThemeView()
                    SectionHeaderView(title: "STUNDENPROTOKOLLE")
                    ForEach(viewModel.taskItems.prefix(4)) { item in
                        TaskItemView(item: item)
                    }
                    SectionHeaderView(title: "ÜBERPRÜFUNGEN")
                    ForEach(viewModel.taskItems.suffix(1)) { item in
                        TaskItemView(item: item)
                    }
                }
                .padding()
            }
            ABottomNavigationView()
        }
    }
}

struct ATopBarView: View {
    var body: some View {
        HStack {
            Text("08:30")
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Button(action: {
                // Action for back button
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("KALENDER")
                }
            }
            Spacer()
            Image(systemName: "calendar")
                .font(.system(size: 24))
        }
        .padding()
        .background(Color.green)
        .foregroundColor(.white)
    }
}

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Englisch 4A")
                .font(.system(size: 24, weight: .bold))
            Text("Fr 20.04.2020")
                .font(.system(size: 18))
                .foregroundColor(.gray)
        }
    }
}

struct ThemeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Thema:")
                .font(.system(size: 18))
                .foregroundColor(.gray)
            Text("London Sightseeing")
                .font(.system(size: 18, weight: .bold))
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
        }
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
    }
}

struct TaskItemView: View {
    let item: TaskItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: item.icon)
                    .foregroundColor(item.color)
                Text(item.category)
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                if !item.values.isEmpty {
                    HStack(spacing: 8) {
                        ForEach(item.values, id: \.self) { value in
                            Text(value)
                        }
                    }
                }
            }
            if let detail = item.detail {
                Text(detail)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
    }
}

struct ABottomNavigationView: View {
    var body: some View {
        HStack {
            ABottomNavigationItemView(icon: "calendar", label: "Kalender")
            Spacer()
            ABottomNavigationItemView(icon: "paintbrush", label: "Leistung")
            Spacer()
            ABottomNavigationItemView(icon: "doc.text", label: "Verwaltung")
            Spacer()
            ABottomNavigationItemView(icon: "person", label: "Profil")
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}

struct ABottomNavigationItemView: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(label)
                .font(.system(size: 12))
        }
        .foregroundColor(.gray)
    }
}


