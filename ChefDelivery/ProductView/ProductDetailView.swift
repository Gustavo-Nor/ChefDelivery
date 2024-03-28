//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 28/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State private var productQuantity = 1
    
    let product: ProductType
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailsButtonView()
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailsButtonView: View {
    var body: some View {
        Button {
            print("O botão foi pressionado")
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 8)
        }
    }
}
