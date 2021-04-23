//
//  Amico.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import Foundation

class Amico: ObservableObject {
  var nome: String
  @Published var regali: RegaloStore
  
  init(
    nome: String = "Nessun amico",
    regali: RegaloStore = RegaloStore() )
  {
    self.nome = nome
    self.regali = regali
  }
}

extension Amico: Hashable, Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Amico: Equatable {
  static func == (lhs: Amico, rhs: Amico) -> Bool {
    lhs === rhs
  }
}

class AmicoStore: ObservableObject {
  static let defaultAmici = [
    Amico(nome: "Pino", regali: RegaloStore()),
    Amico(nome: "Gino", regali: RegaloStore()),
    /*
    Amico(nome: "Lino", regali: RegaloStore()),
    Amico(nome: "Cino", regali: RegaloStore()),
    Amico(nome: "Dino", regali: RegaloStore()),
    Amico(nome: "Mino", regali: RegaloStore()),
    Amico(nome: "Nino", regali: RegaloStore()),
    Amico(nome: "Rino", regali: RegaloStore()),
    Amico(nome: "Tino", regali: RegaloStore()),
    */
  ]
  
  static func loadAmici() -> [Amico] {
    AmicoStore.defaultAmici
  }
  
  @Published var amici = loadAmici()
  
  func addAmico(nome: String) {
    let newAmico = Amico(nome: nome)
    amici.append(newAmico)
  }
  
  func deleteAmico(at offsets: IndexSet) {
    amici.remove(atOffsets: offsets)
  }
  
  func editRegalo() {
    objectWillChange.send()
  }
}


