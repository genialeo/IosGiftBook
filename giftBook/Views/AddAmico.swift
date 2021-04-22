//
//  AddAmico.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AddAmico: View {
  @ObservedObject var amico = Amico(nome: "")
  @EnvironmentObject var amicoStore: AmicoStore
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
            amicoStore.addAmico(nome: amico.nome)
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .padding()
    }
  }
}

struct AddAmico_Previews: PreviewProvider {
  static var previews: some View {
    AddAmico()
  }
}
