//
//  AddRegaloView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AddRegaloView: View {
  @ObservedObject var amico = Amico(nome: "")
  @ObservedObject var regali = Regali()
  //@EnvironmentObject var amici: Amici
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack (spacing: 24) {
        TextField("Regalo:", text: $amico.nome)
        TextField("Prezzo:", text: $amico.nome)
        TextField("Acquistato:", text: $amico.nome)
      }
      .navigationBarTitle("Regalo per \(amico.nome)")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            print(amico.nome)
            /*
            amici.addAmico(amico)
            
            for friend: Amico in amici.lista {
              print(friend.nome)
            }
            */
            
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
    AddRegaloView().environmentObject(Regali())
  }
}
