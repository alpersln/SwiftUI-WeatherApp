//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by calatinalper on 1.07.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text(viewModel.timezone)
                    .font(.system(size: 34))
                Text(viewModel.temp)
                    .font(.system(size: 24))
                Text(viewModel.humidity)
                    .font(.system(size: 24))
                Text(viewModel.title)
                    .font(.system(size: 44))
                Text(viewModel.descriptionText)
                    .font(.system(size: 24))


            }
            .navigationBarTitle("Weather SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
