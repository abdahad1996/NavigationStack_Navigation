//
//  ProfilView.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

 struct LeistungView: View {
    var body: some View {
        CourseListView()
    }
}

import SwiftUI

struct CourseListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Leistung")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)

            List(courses,id: \.id) { course in
                CourseRow(course: course)
            }
            .listStyle(PlainListStyle())
        }
    }

    struct Course: Identifiable {
        let id = UUID()
        let name: String
        let icon: String
        let color: Color
    }

    let courses = [
        Course(name: "Englisch 4A", icon: "En", color: .yellow),
        Course(name: "Englisch 4B", icon: "En", color: .blue),
        Course(name: "Englisch 4C", icon: "En", color: .pink),
        Course(name: "Englisch 4D", icon: "En", color: .purple),
        Course(name: "Geographie 5A", icon: "Globe", color: .purple)
    ]

    struct CourseRow: View {
        let course: Course

        var body: some View {
            HStack {
                Circle()
                    .fill(course.color)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(course.icon)
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                Text(course.name)
                    .font(.headline)
                Spacer()
            }
            .padding([.top, .bottom], 8)
        }
    }
}

 
