//
//  Regali.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import Foundation

class Regalo: ObservableObject {
  let id: String
  @Published var descrizione: String
  //var prezzo: Double
  @Published var prezzo: String
  @Published var acquistato: Bool
  
  init(
    descrizione: String = "Nessun regalo",
    //prezzo: Double = 0.0,
    prezzo: String = "0.0",
    acquistato: Bool = false)
  {
    self.id = UUID().uuidString
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
  let id = UUID()
  @Published var listaAcquistati: [Regalo] = []
  @Published var listaDaAcquistare: [Regalo] = []
  
  @Published var lista: [Regalo] = [
    .init(descrizione: "Libro", prezzo: "20.0", acquistato: true ),
    .init(descrizione: "DVD", prezzo: "10.0", acquistato: false),
    /*
    .init(descrizione: "CD", prezzo: "5.0", acquistato: false),
    .init(descrizione: "Vinile", prezzo: "11.0", acquistato: false),
    .init(descrizione: "Ombrello", prezzo: "5.0", acquistato: false),
    .init(descrizione: "Poster", prezzo: "12.0", acquistato: true),
    .init(descrizione: "Dinosauro", prezzo: "15.0", acquistato: true),
    .init(descrizione: "Bambola", prezzo: "30.0", acquistato: true),
    .init(descrizione: "Gioco", prezzo: "40.0", acquistato: true),
    .init(descrizione: "VideoGame", prezzo: "60.0", acquistato: false),
    */
  ]
  
  func loadAcquistati()  {
    for regalo in (lista.filter{$0.acquistato}) {
      print ("\(regalo.id):\(regalo.descrizione):\(regalo.prezzo)")
    }
    listaAcquistati = lista.filter{$0.acquistato}
  }
  
  func loadDaAcquistare()  {
    listaDaAcquistare = lista.filter{$0.acquistato == false}
  }
  
  //func addRegalo(descrizione: String, prezzo: Double, acquistato: Bool) {
  func addRegalo(descrizione: String, prezzo: String, acquistato: Bool) {
    let newRegalo = Regalo(descrizione: descrizione, prezzo: prezzo, acquistato: acquistato)
    lista.append(newRegalo)
  }
  
  func deleteRegalo(at offsets: IndexSet) {
    lista.remove(atOffsets: offsets)
  }
}

