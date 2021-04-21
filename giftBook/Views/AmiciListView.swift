//
//  AmiciList.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

struct AmiciListView: View {
  @State var showingAddAmico = false
  @EnvironmentObject var amici: Amici
  
  var body: some View {
    VStack {
      NavigationView {
        List {
          ForEach(amici.lista) { amico in
            AmicoRowView(amico: amico)
          }
        }
        .navigationBarTitle("Amici")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Aggiungi") {
              showingAddAmico = true
            }
          }
        }
        .sheet(
          isPresented: $showingAddAmico,
          content: AddAmicoView.init
        )
      }
    }
  }
  
  struct AmicoRowView: View {
    @ObservedObject var amico: Amico
    @EnvironmentObject var amici: Amici
    
    var body: some View {
      NavigationLink(destination: AmicoView(amico: amico)) {
        HStack {
          Amico.Image(nome: amico.nome)
          VStack(alignment: .leading) {
            Text(amico.nome)
              .font(.title2)
            Text(amico.nome)
              .font(.title3)
              .foregroundColor(.secondary)
          }
          .lineLimit(1)
        }
      }
    }
  }
  
  struct AmiciListView_Previews: PreviewProvider {
    static var previews: some View {
      AmiciListView().environmentObject(Amici())
    }
  }
  
}
