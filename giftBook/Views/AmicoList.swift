//
//  AmicoList.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 21/04/2021.
//

import SwiftUI

struct AmicoList: View {
  @EnvironmentObject var amicoStore: AmicoStore
  @State private var showingAddAmico = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(amicoStore.amici) { amico in
          AmicoRowView(amico: amico)
        }
      }
      .navigationBarTitle(Text("Amici"))
      .navigationBarItems(
        trailing:
          Button(action: { showingAddAmico = true
          }) {
            Image(systemName: "plus")
          }
      )
      .sheet(
        isPresented: $showingAddAmico,
        content: AddAmico.init
      )
    }
  }
}

struct AmicoRowView: View {
  var amico: Amico
  var body: some View {
    NavigationLink(destination: AmicoDetail(amico: amico, regali: amico.regali)) {
      VStack {
        Text(amico.nome)
          .font(.title)
        Text("\(amico.regali.lista.count) regali")
          .font(.callout)
          .foregroundColor(.secondary)
      }
    }
    /*
    .onAppear {
      print("\(amico.nome)")
      let regali = amico.regali.lista
      print(amico.regali.id)
      for regalo in regali {
        print ("\(regalo.id):\(regalo.descrizione):\(regalo.prezzo)")
      }
    }
  */
  }
}


struct AmicoList_Previews: PreviewProvider {
  static var previews: some View {
    AmicoList()
  }
}
