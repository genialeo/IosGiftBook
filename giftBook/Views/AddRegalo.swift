//
//  AddRegalo.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AddRegalo: View {
  @ObservedObject var amico: Amico
  @ObservedObject var regali: RegaloStore
  @StateObject var regalo = Regalo(descrizione: "")
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack (alignment: .leading, spacing: 24) {
        Text("Cosa vuoi comprare?")
        TextField("Regalo", text: $regalo.descrizione)
        Text("Quanto costa?")
        TextField("Prezzo", text: $regalo.prezzo)
        //TextField("Prezzo", value: $regalo.prezzo, formatter: NumberFormatter())
        Toggle(isOn: $regalo.acquistato) {
          Text("Acquistato")
        }
      }
      .navigationBarTitle("Nuovo regalo per \(amico.nome)")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            amico.regali.addRegalo(descrizione: regalo.descrizione, prezzo: regalo.prezzo, acquistato: regalo.acquistato)
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .padding()
    }
  }
}

struct AddRegalo_Previews: PreviewProvider {
  static var previews: some View {
    AddRegalo(amico: Amico(), regali: RegaloStore())
  }
}


