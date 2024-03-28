//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 28/03/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                } label: {
                    if productQuantity > 1 {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .bold()
                    }
                    
                    if productQuantity == 1 {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()

                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
