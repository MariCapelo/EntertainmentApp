//
//  ListTaskView.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 13/03/25.
//

import SwiftUI

struct ListTaskView: View {
    @State var tasks: [TaskModel] = [
        
    ]
    
    @State var addTask: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                if tasks.isEmpty {
                    Text("Ops, você ainda não possui tarefas")
                        .fontWeight(.thin)
                        .foregroundStyle(.secondary)
                        
                } else {
                    Section {
                        ForEach(tasks) { task in
                            TaskView(task: task)
                                .swipeActions(allowsFullSwipe: false) {
                                    deleteTask(task)
                                }
                        }
                    } header: {
                        Text("Tasks")
                    } footer: {
                        Text("TOTAL: \(tasks.count)")
                    }
                }
            } //List
            .sheet(isPresented: $addTask) {
                AddTaskView(tasks: $tasks)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addTask.toggle()
                    } label: {
                        Label {
                            Text("Add Task")
                        } icon: {
                            Image(systemName: "plus")
                        }

                    }
                }
            }
            .navigationTitle("Tasks List")
        }
    }
    
    func deleteTask(_ task: TaskModel) -> some View{
        Button(role: .destructive) {
            tasks.removeAll { currentTask in
                currentTask.id == task.id
            }
        } label: {
            Label {
                Text("Delete")
            } icon: {
                Image(systemName: "trash")
            }

        }
    }
}

#Preview {
    ListTaskView()
}
