//
//  ListaAmici.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import Combine

class Amici: ObservableObject {
  var lista: [Amico] { listaCache }
  
  func addAmico(_ amico: Amico) {
    listaCache.insert(amico, at:0)
  }
  
  func getAmico() {
    listaCache.first
  }

  @Published private var listaCache: [Amico] = [
    .init(nome: "Pino", regali: Regali()),
    .init(nome: "Lino", regali: Regali()),
    .init(nome: "Mino", regali: Regali()),
    .init(nome: "Tino", regali: Regali()),
    .init(nome: "Gino", regali: Regali()),
    .init(nome: "Rino", regali: Regali()),
    .init(nome: "Nino", regali: Regali()),
    .init(nome: "Cino", regali: Regali()),
    .init(nome: "Dino", regali: Regali()),
    .init(nome: "Vino", regali: Regali()),
  ]
}

class Regali: ObservableObject {
  var lista: [Regalo] { listaCache }
  
  func addRegalo(_ regalo: Regalo) {
    listaCache.insert(regalo, at:0)
  }
  
  func getRegalo() {
    listaCache.first
  }

  @Published private var listaCache: [Regalo] = [
    .init(descrizione: "Libro", prezzo: 20.0),
    .init(descrizione: "DVD", prezzo: 10.0),
    .init(descrizione: "CD", prezzo: 5.0),
  ]

}
