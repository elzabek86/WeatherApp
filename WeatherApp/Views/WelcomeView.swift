//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Jarek  on 05/10/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Text("Weather App")
                    .bold().font(.title)
                
                Text("Please share your courrent location to get the weather in your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(15)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
