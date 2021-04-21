//
//  Amico.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//
import Combine

class Amico: ObservableObject {
  @Published var nome: String
  @Published var regali: Regali?
  
  init(
    nome: String = "Nessuno",
    regali: Regali = Regali() ) {
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
