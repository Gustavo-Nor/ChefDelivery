//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 26/03/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State private var minDistance: Double = 0
    @State private var maxDistance: Double = 100
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter && (store.distance >= minDistance && store.distance <= maxDistance)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()

                    
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }

                    }
                }
                .foregroundColor(.black)
                
                
                Menu("Distância") {
                    
                    Button {
                        minDistance = 0
                        maxDistance = 100
                    } label: {
                        Text("Limpar filtro")
                    }

                    Divider()
                    
                    ForEach(Array(stride(from: 0, to: 20, by: 5)), id: \.self) { distance in
                        Button {
                            minDistance = distance
                            maxDistance = distance + 5
                        } label: {
                            Text("De \(String(format: "%.0f", distance)) até \(String(format: "%.0f", distance + 5)) km")
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }

                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
}
