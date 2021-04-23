//
//  EditRegalo.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 23/04/2021.
//

import SwiftUI

struct EditRegalo: View {
  @ObservedObject var regalo: Regalo
  @EnvironmentObject var store: AmicoStore
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack (alignment: .leading, spacing: 24) {
        Text(regalo.descrizione)
        //Text("Prezzo: \(regalo.prezzo, specifier: "%.2f")")
        TextField("Prezzo", text: $regalo.prezzo)
        Toggle(isOn: $regalo.acquistato) {
          Text("Acquistato")
        }
      }
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Salva") {
            store.editRegalo()
            presentationMode.wrappedValue.dismiss()
          }
        }
      }
      .padding()
    }
  }
  
  func BoolToString(b: Bool?)->String { return b?.description ?? "<None>"}
  
}

struct EditRegalo_Previews: PreviewProvider {
  static var previews: some View {
    EditRegalo(regalo: Regalo())
  }
}
