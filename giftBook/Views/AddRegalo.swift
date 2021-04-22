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
      VStack (spacing: 24) {
        TextField("Regalo", text: $regalo.descrizione)
        Toggle(isOn: $regalo.acquistato) {
          Text("Acquistato")
        }
      }
      .navigationBarTitle("Nuovo regalo per \(amico.nome)")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            amico.regali.addRegalo(descrizione: regalo.descrizione, prezzo: 10.0, acquistato: regalo.acquistato)
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

