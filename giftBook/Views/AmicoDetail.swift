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
      ForEach(regali.lista) { regalo in
        RegaloRowView(regalo: regalo, amico: amico)
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
    var amico: Amico
    var body: some View {
      NavigationLink(destination: RegaloDetail(regalo: regalo, amico: amico)) {
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
