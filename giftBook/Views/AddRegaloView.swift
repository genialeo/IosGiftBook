//
//  AddRegaloView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AddRegaloView: View {
  @ObservedObject var regalo = Regalo(descrizione: "")
  @ObservedObject var amico: Amico
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack (spacing: 24) {
        TextField("Regalo:", text: $regalo.descrizione)
        //TextField("Prezzo:", text: Double($regalo.prezzo))
        //TextField("Acquistato:", text: $regalo.nome)
      }
      .navigationBarTitle("Nuovo regalo per \(amico.nome)")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            if let regali = amico.regali {
              regali.addRegalo(Regalo(descrizione: regalo.descrizione))
            }
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .padding()
    }
  }
}

struct AddRegaloView_Previews: PreviewProvider {
  static var previews: some View {
    AddRegaloView(amico: .init())
  }
}
