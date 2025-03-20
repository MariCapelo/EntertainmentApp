//
//  DetailsTaskView.swift
//  entertainmentApp
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct DetailsTaskView: View {
    var item: TaskModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Título: ")
                    .fontWeight(.bold)
                Text(item.title)
            }
            HStack{
                Image(systemName: "clock")
                Text("Hora")
            }
        }
    }
}



#Preview {
    DetailsTaskView(item:TaskModel(
        title: "Teste",
        date: Date(),
        isDone: false))
}
