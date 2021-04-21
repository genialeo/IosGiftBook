//
//  AddAmicoView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

struct AddAmicoView: View {
  @ObservedObject var amico = Amico(nome: "")
  @EnvironmentObject var amici: Amici
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack (spacing: 24) {
        TextField("Nome", text: $amico.nome)
      }
      .navigationBarTitle("Aggiungi un amico")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            amici.addAmico(amico)
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .padding()
    }
  }
}

struct AddAmicoView_Previews: PreviewProvider {
  static var previews: some View {
    AddAmicoView().environmentObject(Amici())
  }
}
