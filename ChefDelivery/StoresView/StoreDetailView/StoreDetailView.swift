//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 27/03/24.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack(alignment: .leading){
                
                StoreDetailsHeaderView(store: store)
                
                StoreDetailProductView(products: store.products)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    }

                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
