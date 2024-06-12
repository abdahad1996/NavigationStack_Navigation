//
//  ScheduleDetailView.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI


struct ScheduleDetail: Identifiable {
    let id = UUID()
    let category: String
    let detail: String?
    let icon: String
    let color: Color
    let values: [String]
}


import SwiftUI

class ScheduleDetailViewModel: ObservableObject {
    @Published var scheduleDetails: [ScheduleDetail] = [
        ScheduleDetail(category: "Anwesenheit", detail: nil, icon: "person.3", color: .yellow, values: ["0", "0", "0", "7"]),
        ScheduleDetail(category: "Hausübungen", detail: nil, icon: "book", color: .red, values: ["0", "0", "2", "0", "5"]),
        ScheduleDetail(category: "Mündliche Mitarbeit", detail: nil, icon: "text.bubble", color: .purple, values: ["1", "0", "0", "6"]),
        ScheduleDetail(category: "Referate", detail: "Erika Musterfrau", icon: "mic", color: .green, values: []),
        ScheduleDetail(category: "Schriftliche Wiederholungen", detail: "E-Vokabeltest", icon: "pencil", color: .green, values: [])
    ]
}

import SwiftUI

struct ScheduleDetailView: View {
    @EnvironmentObject var navigationManager: HomeNavigationManager
    @StateObject var viewModel = ScheduleDetailViewModel()
    let scheduleItem: ScheduleItem

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

       var backButton : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
//               Image("backImage") // BackButton Image
//                   .aspectRatio(contentMode: .fit)
//                   .foregroundColor(.white)
                   Text("< Kalendar") //translated Back button title
               }
           }
       }
    
    var body: some View {
        VStack(spacing: 0) {
//            ScheduleDetailTopBarView()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ScheduleDetailTitleView()
                    ScheduleDetailThemeView()
                    ScheduleDetailSectionHeaderView(title: "STUNDENPROTOKOLLE")
                    ForEach(viewModel.scheduleDetails.prefix(4),id: \.id) { item in
                        ScheduleDetailTaskItemView(item: item)
                        
                    }.onTapGesture {
                        navigationManager.navigate(to: .mündlicheView)
                    }
                    ScheduleDetailSectionHeaderView(title: "ÜBERPRÜFUNGEN")
                    ForEach(viewModel.scheduleDetails.suffix(1),id: \.id) { item in
                        ScheduleDetailTaskItemView(item: item)
                    }.onTapGesture {
                        navigationManager.navigate(to: .mündlicheView)
                    }
                }
                .padding()
            }
            
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
}

struct ScheduleDetailTopBarView: View {
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

struct ScheduleDetailTitleView: View {
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

struct ScheduleDetailThemeView: View {
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

struct ScheduleDetailSectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
    }
}

struct ScheduleDetailTaskItemView: View {
    let item: ScheduleDetail
    
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
