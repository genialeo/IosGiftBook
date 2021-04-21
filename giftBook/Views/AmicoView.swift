//
//  AmicoView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 20/04/2021.
//

import SwiftUI

struct AmicoView: View {
  @State var showingAddRegalo = false
  let amico: Amico
  var body: some View {
    if let regali = amico.regali {
      VStack {
        
          List {
            ForEach(regali.lista) { regalo in
              Text(regalo.descrizione)
            }
          }
          .navigationBarTitle("Regali per \(amico.nome)")
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button("Aggiungi") {
                showingAddRegalo = true
              }
            }
          }
          .sheet(
            isPresented: $showingAddRegalo,
            content: AddRegaloView.init
          )
        
      }
    }
    else {
      Text("non ci sono regali")
    }
  }
}

struct AmicoView_Previews: PreviewProvider {
  static var previews: some View {
    AmicoView(amico: .init())
  }
}
