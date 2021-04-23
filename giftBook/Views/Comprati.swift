//
//  Comprati.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 22/04/2021.
//

import SwiftUI

struct Comprati: View {
  @EnvironmentObject var amicoStore: AmicoStore
  
  var body: some View {
    NavigationView {
      List{
        ForEach(amicoStore.amici) {amico in
          let acquistati = amico.regali.acquistati()
          ForEach(acquistati) {regalo in
            CompratiRowView(amico: amico, regalo: regalo)
          }
        }
      }.navigationBarTitle(Text("Acquistati"))
    }
  }
}

struct CompratiRowView: View {
  var amico: Amico
  var regalo: Regalo
  var body: some View {
    NavigationLink(destination: RegaloDetail(regalo: regalo)) {
      VStack {
        Text(regalo.descrizione)
          .font(.title2)
        Text(amico.nome)
          .font(.title3)
          .foregroundColor(.secondary)
      }
    }
  }
}

struct Comprati_Previews: PreviewProvider {
  static var previews: some View {
    Comprati()
  }
}


