//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 27/03/24.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
