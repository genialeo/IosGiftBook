//
//  AmicoDetail.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AmicoDetail: View {
  @State private var showingAddRegalo = false
  @ObservedObject var amico: Amico
  @ObservedObject var regali: RegaloStore
  
  var body: some View {
    List {
      ForEach(regali.lista, id: \.self) { regalo in
        RegaloRowView(regalo: regalo)
      }
    }
    .navigationBarTitle("Regali per \(amico.nome)")
    .navigationBarItems(
      trailing:
        Button(action: { showingAddRegalo = true
        }) {
          Image(systemName: "plus")
        }
    )
    .sheet(
      isPresented: $showingAddRegalo) {
      AddRegalo(amico: amico, regali: regali)
      }
  }
  
}
  
  struct RegaloRowView: View {
    var regalo: Regalo
    var body: some View {
      NavigationLink(destination: RegaloDetail(regalo: regalo)) {
        VStack {
          Text(regalo.descrizione)
            .font(.title2)
        }
      }
    }
}

struct AmicoDetail_Previews: PreviewProvider {
  static var previews: some View {
    AmicoDetail(amico: Amico(), regali: RegaloStore())
  }
}
