//
//  ContentView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      AmiciView()
      RegaliDaComprareView()
      RegaliCompratiView()
      BudgetView()
    }
    .padding()
    .font(.headline)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct AmiciView: View {
  
  var body: some View {
    AmicoList()
      .tabItem {
        Image(systemName: "person.3.fill")
        Text("Amici")
      }
  }
}

struct RegaliDaComprareView: View {
  var body: some View {
    DaComprare()
      .tabItem {
        Image(systemName: "gift")
        Text("Da comprare")
      }
  }
}

struct RegaliCompratiView: View {
  var body: some View {
    Comprati()
      .tabItem {
        Image(systemName: "gift.fill")
        Text("Comprati")
      }
  }
}

struct BudgetView: View {
  var body: some View {
    Text("To be done")
      .tabItem {
        Image(systemName: "dollarsign.square")
        Text("Budget")
      }
  }
}
