//
//  AboutView.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Little lemon")
                    .font(.headline)
                Text("Chicago")
                    .font(.subheadline)
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            }
            Spacer()
            Image(systemName: "wineglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            Spacer()
        }
    }
}

#Preview {
    AboutView()
}
