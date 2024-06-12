//
//  StudentDetail.swift
//  Hackathon
//
//  Created by macbook abdul on 12/06/2024.
//

import Foundation
import SwiftUI

struct StudentDetailView: View {
    
    var studentName: String = "David Breuer"
    var className: String = "Englisch 4A"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
//               Image("backImage") // BackButton Image
//                   .aspectRatio(contentMode: .fit)
//                   .foregroundColor(.white)
                Text("< Mündliche Mitarbeit") //translated Back button title
            }
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
//            HStack {
//                Button(action: {
//                    // Back button action
//                }) {
//                    Image(systemName: "arrow.left")
//                        .foregroundColor(.black)
//                }
//                Text("MÜNDLICHE MITARBEIT")
//                    .font(.headline)
//                    .padding(.leading)
//                Spacer()
//                Button(action: {
//                    // Info button action
//                }) {
//                    Image(systemName: "info.circle")
//                        .foregroundColor(.black)
//                }
//            }
//            .padding()

            Text(studentName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
            Text(className)
                .font(.subheadline)
                .padding([.leading, .bottom])

            List(feedback,id: \.id) { item in
                FeedbackRow(feedbackItem: item)
            }
            .listStyle(PlainListStyle())
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }

    struct FeedbackItem: Identifiable {
        let id = UUID()
        let date: String
        let type: FeedbackType
        let comment: String?
    }

    enum FeedbackType {
        case positive, neutral, negative
    }

    let feedback = [
        FeedbackItem(date: "20.04.2020", type: .positive, comment: nil),
        FeedbackItem(date: "17.04.2020", type: .positive, comment: nil),
        FeedbackItem(date: "15.04.2020", type: .negative, comment: "Schläft im Unterricht"),
        FeedbackItem(date: "12.04.2020", type: .positive, comment: nil),
        FeedbackItem(date: "21.03.2020", type: .neutral, comment: nil),
        FeedbackItem(date: "04.04.2020", type: .positive, comment: nil),
        FeedbackItem(date: "21.03.2020", type: .neutral, comment: nil),
        FeedbackItem(date: "28.03.2020", type: .positive, comment: nil),
        FeedbackItem(date: "21.03.2020", type: .neutral, comment: nil)
    ]

    struct FeedbackRow: View {
        let feedbackItem: FeedbackItem

        var body: some View {
            HStack {
                Image(systemName: "bubble.left")
                VStack(alignment: .leading) {
                    Text(feedbackItem.date)
                        .font(.headline)
                    if let comment = feedbackItem.comment {
                        Text(comment)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                feedbackTypeIcon
            }
            .padding([.top, .bottom], 8)
        }

        var feedbackTypeIcon: some View {
            switch feedbackItem.type {
            case .positive:
                return Image(systemName: "plus.circle")
                    .foregroundColor(.green)
            case .neutral:
                return Image(systemName: "minus.circle")
                    .foregroundColor(.yellow)
            case .negative:
                return Image(systemName: "minus.circle")
                    .foregroundColor(.red)
            }
        }
    }
}


