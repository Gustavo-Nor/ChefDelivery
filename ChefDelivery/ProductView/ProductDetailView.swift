//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 28/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State private var productQuantity = 1
    
    var service = HomeService()
    
    let product: ProductType
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailsButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailsButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button {
            print("O botão foi pressionado")
            onButtonPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
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
