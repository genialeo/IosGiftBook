//
//  AmicoDetail.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AmicoDetail: View {
  @State private var showingAddRegalo = false
  @ObservedObject var amico: Amico
  @ObservedObject var regali: RegaloStore
  
  var body: some View {
    List {
      ForEach(regali.lista, id: \.self) { regalo in
        Text(regalo.descrizione)
      }
    }
    .navigationBarTitle("Regali per \(amico.nome)")
    .navigationBarItems(
      trailing:
        Button(action: { showingAddRegalo = true
        }) {
          Image(systemName: "plus")
        }
    )
    .sheet(
      isPresented: $showingAddRegalo) {
      AddRegalo(amico: amico, regali: regali)
      }
  }
}

struct AmicoDetail_Previews: PreviewProvider {
  static var previews: some View {
    AmicoDetail(amico: Amico(), regali: RegaloStore())
  }
}
