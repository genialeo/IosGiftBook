//
//  Regali.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import Foundation

class Regalo: ObservableObject {
  var descrizione: String
  var prezzo: Double
  var acquistato: Bool
  
  init(
    descrizione: String = "Nessun regalo",
    prezzo: Double = 0.0,
    acquistato: Bool = false)
  {
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

class RegaloStore: ObservableObject {
  static let defaultRegali = [
    Regalo(descrizione: "Libro", prezzo: 20.0, acquistato: false ),
    Regalo(descrizione: "DVD", prezzo: 10.0, acquistato: false),
    Regalo(descrizione: "CD", prezzo: 5.0, acquistato: false),
  ]
  
  static func loadRegali() -> [Regalo] {
    RegaloStore.defaultRegali
  }
  
  @Published var lista = loadRegali()
  
  func addRegalo(descrizione: String, prezzo: Double, acquistato: Bool) {
    let newRegalo = Regalo(descrizione: descrizione, prezzo: prezzo, acquistato: acquistato)
    lista.append(newRegalo)
  }
  
  func deleteRegalo(at offsets: IndexSet) {
    lista.remove(atOffsets: offsets)
  }
}


