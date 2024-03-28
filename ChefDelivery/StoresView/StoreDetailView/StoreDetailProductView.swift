//
//  StoreDetailProductView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 28/03/24.
//

import SwiftUI

struct StoreDetailProductView: View {
    
    let products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(products) { product in
                
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailsProductItemView(product: product)
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductView(products: storesMock[0].products)
}
