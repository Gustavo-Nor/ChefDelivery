//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Attributes
    private var service = HomeService()
    
    //MARK: - View
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear {
            service.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
