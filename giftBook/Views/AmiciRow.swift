//
//  BookView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

extension Amico {
  struct Image: View {
    let nome: String
    
    var body: some View {
      let symbol =
        SwiftUI.Image(nome: nome)
        ?? .init(systemName: "amico")
      
      symbol
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .font(Font.title.weight(.light))
        .foregroundColor(.secondary)
    }
  }
}

struct AmicoRow_Previews: PreviewProvider {
  static var previews: some View {
    Amico.Image(nome: Amico().nome)
  }
}

extension Image {
  init?(nome: String) {
    guard
      let character = nome.first,
      case let symbolName = "\(character.lowercased()).square",
      UIImage(systemName: symbolName) != nil
    else {
      return nil
    }
    
    self.init(systemName: symbolName)
  }
}
