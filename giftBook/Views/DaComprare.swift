//
//  DaComprare.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 23/04/2021.
//

import SwiftUI

struct DaComprare: View {
  @EnvironmentObject var amicoStore: AmicoStore
  
  var body: some View {
    NavigationView {
      List{
        ForEach(amicoStore.amici) {amico in
          let daAcquistare: () = amico.regali.loadDaAcquistare()
          ForEach(amico.regali.listaDaAcquistare) {regalo in
            CompratiRowView(amico: amico, regalo: regalo)
          }
        }
      }.navigationBarTitle(Text("Da acquistare"))
    }
  }
}

struct DaComprareRowView: View {
  var amico: Amico
  var regalo: Regalo
  var body: some View {
    NavigationLink(destination: RegaloDetail(regalo: regalo, amico: amico)) {
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


struct DaComprare_Previews: PreviewProvider {
  static var previews: some View {
    DaComprare()
  }
}

