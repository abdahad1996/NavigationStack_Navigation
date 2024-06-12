//
//  MündlicheView.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

struct MündlicheView: View {
    @EnvironmentObject var navigationManager: HomeNavigationManager
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

       var backButton : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
//               Image("backImage") // BackButton Image
//                   .aspectRatio(contentMode: .fit)
//                   .foregroundColor(.white)
                   Text("< English 4A") //translated Back button title
               }
           }
       }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Mündliche Mitarbeit")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    // Info button action
                }) {
                    Image(systemName: "info.circle")
                }
            }
            .padding()

            HStack {
                Text("Englisch 4A")
                Spacer()
                Text("Fr 20.04.2020")
            }
            .padding([.leading, .trailing, .bottom])

            List(students,id: \.id) { student in
                StudentRow(student: student).onTapGesture {
                    navigationManager.navigate(to: .studentDetailView)
                }
            }
            .listStyle(PlainListStyle())
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }

    struct Student: Identifiable {
        let id = UUID()
        let name: String
        let surname: String
    }

    let students = [
        Student(name: "David", surname: "Breuer"),
        Student(name: "Emilia", surname: "Lehner"),
        Student(name: "Martin", surname: "Manninger"),
        Student(name: "Erika", surname: "Musterfrau"),
        Student(name: "Sophia", surname: "Peiper"),
        Student(name: "Lucas", surname: "Oberlander"),
        Student(name: "Tom", surname: "Weingartner")
    ]

    struct StudentRow: View {
        let student: Student

        var body: some View {
            HStack {
                Image(systemName: "bubble.left")
                VStack(alignment: .leading) {
                    Text(student.name)
                        .font(.headline)
                    Text(student.surname)
                        .font(.subheadline)
                }
                Spacer()
                HStack(spacing: 8) {
                    Button(action: {
                        // Plus button action
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                    }
                    Button(action: {
                        // Tilde button action
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.gray)
                    }
                    Button(action: {
                        // Minus button action
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }
            }
            .padding([.top, .bottom], 8)
        }
    }
}

 
