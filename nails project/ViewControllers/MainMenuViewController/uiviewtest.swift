//
//  uiviewtest.swift
//  nails project
//
//  Created by Antony Razhnou on 4/16/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("SwiftUI for IOS 14")
                    .font(.title)
                    .fontWeight(.bold)
                Text("A complete guide to designing for iOS 14 with videos, examples and design files")
                Text("20 sections - 3 hours")
            }
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
