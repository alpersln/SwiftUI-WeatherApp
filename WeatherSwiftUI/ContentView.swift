//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by calatinalper on 1.07.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView{
            
            VStack{
                        Picker("Mode",selection: $isDarkMode){
                                Text("Light")
                                    .tag(false)
                                Text("dark")
                                    .tag(true)
                            }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                
                Spacer()
                
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
                    
                Spacer()
            }
        
            .navigationBarTitle("Weather SwiftUI")
        }.preferredColorScheme(isDarkMode ? .dark : .light)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
