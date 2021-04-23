//
//  RegaloDetail.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 22/04/2021.
//

import SwiftUI

struct RegaloDetail: View {
  @ObservedObject var regalo: Regalo
  @ObservedObject var amico: Amico
  @State private var showingEditRegalo = false
  
  var body: some View {
    Text(regalo.descrizione)
    //Text("Prezzo: \(regalo.prezzo, specifier: "%.2f")")
    Text("Prezzo: \(regalo.prezzo)")
    Text("Acquistato: \(BoolToString(b: regalo.acquistato))")
      //.navigationBarTitle("Regali per \(amico.nome)")
      .navigationBarItems(
        trailing:
          Button(action: { showingEditRegalo = true
          }) {
            Text("Edit")
          }
      )
      .sheet(
        isPresented: $showingEditRegalo) {
        EditRegalo(regalo: regalo)
      }
  }
  
  func BoolToString(b: Bool?)->String { return b?.description ?? "<None>"}
  
}

struct RegaloDetail_Previews: PreviewProvider {
  static var previews: some View {
    EditRegalo(regalo: Regalo())
  }
}

