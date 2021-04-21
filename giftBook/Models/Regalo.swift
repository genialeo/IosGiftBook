//
//  Regalo.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 20/04/2021.
//

import Combine

class Regalo: ObservableObject {
  @Published var descrizione: String
  @Published var prezzo: Double
  @Published var acquistato: Bool
  
  init(
    descrizione: String = "Nessuno",
    prezzo: Double = 0.0,
    acquistato: Bool = true
    ) {
      self.descrizione = descrizione
      self.prezzo = prezzo
      self.acquistato = acquistato
    }
}

extension Regalo: Hashable, Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Regalo: Equatable {
  static func == (lhs: Regalo, rhs: Regalo) -> Bool {
    lhs === rhs
  }
}
