//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Jarek  on 06/10/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment:
                        .leading)
                
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack (spacing: 20) {
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                                
                                Text(weather.weather[0].main)
                            }
                            .frame(width: 150, alignment:
                                    .leading)
                            
                            Spacer()
                                
                            
                            Text(weather.main.feelsLike
                                .roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                            
                    }
                    Spacer()
                        .frame(height: 80)
                    
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2016/03/12/19/34/city-1252643_1280.png")) { image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value:(weather.main.tempMax.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "rectangle.compress.vertical", name: "Pressure", value:(weather.main.pressure.roundDouble() + ""))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value:(weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value:(weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(15, corners: [.topLeft, .topRight])
            }
                
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.668, saturation: 0.382, brightness: 0.344))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
