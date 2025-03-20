//
//  Teste.swift
//  entertainmentApp
//
//  Created by found on 12/03/25.
//

import Foundation
import Observation

/* OBS 1 = Nesse arquivo esta sendo criado uma classe de atividades com seus respectivos atributos
           de titulo, data e se esta ela esta completa ou nao */

/* OBS 2 = 
 */
@Observable
class TaskModel: Identifiable {
    let title: String
    let date: Date
    var isDone: Bool
    
    init(title: String, date: Date, isDone: Bool = false) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
