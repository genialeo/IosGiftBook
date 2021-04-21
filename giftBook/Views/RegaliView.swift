//
//  RegaliView.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

struct RegaliView: View {
  let amico: Amico
  var body: some View {
    Text(amico.nome)
  }
  
  struct RegaliView_Previews: PreviewProvider {
    static var previews: some View {
      RegaliView(amico: .init())
    }
  }
  
}
