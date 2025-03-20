//
//  AddTaskView.swift
//  entertainmentApp
//
//  Created by found on 13/03/25.
//

import SwiftUI

struct AddTaskView: View {
    @State var taskName: String = ""
    @State var taskDate: Date = Date()
    @Binding var tasks: [TaskModel]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Task Name", text: $taskName)
                DatePicker("Task Date", selection: $taskDate)
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                        let newTask = TaskModel(title: taskName, date: taskDate)
                        tasks.append(newTask)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button{
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Previewable @State var tasks: [TaskModel] = []
    AddTaskView(tasks: $tasks)
}
