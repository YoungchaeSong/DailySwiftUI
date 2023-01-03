//
//  SettingView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/03.
//

import SwiftUI

struct SettingView: View {
    
    @State private var selection: Int = 1
    @State private var setDate: Date = Date()
    @State private var timeZoneOverride: Bool = true
    @State private var volume: Double = 25.0
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    Spacer()
                    Section(header: Text("Date and Time")) {
                        DatePicker(selection: $setDate) {
                            Image(systemName: "calendar.circle")
                        }.foregroundColor(.black)
                    }.listRowBackground(Color.orange)
                    
                    Section(header: Text("Time Zone Override")) {
                        Toggle(isOn: $timeZoneOverride) {
                            HStack {
                                Image(systemName: "time")
                                Text("Override")
                            }.foregroundColor(.black)
                        }
                    }.listRowBackground(Color.orange)
                    
                    Section(header: Text("Alarm Volume")) {
                        Text("Volume \(String(format: "%.0f", volume as Double)) Decibels")
                            .foregroundColor(.black)
                        Slider(value: $volume, in: 0...100) { _ in
                            
                        }
                    }.listRowBackground(Color.orange)
                    
                    Section(header: Text("Repeat Alarm")) {
                        Picker(selection: $selection) {
                            Text("No Repeat").tag(1)
                            Text("Repeat Once").tag(2)
                            Text("Repeat Twice").tag(3)
                        } label: {
                            Text("Repeat Alarm:")
                        }
                        .foregroundColor(.black)
                    }.listRowBackground(Color.orange)
                    
                    Button {
                        withAnimation(.easeOut(duration: 1.0)) {
                            self.show = false
                        }
                    } label: {
                        Text("Save")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .listRowBackground(Color.green)
                }
            }
            .frame(width: 350, height: 625)
            .cornerRadius(20)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(show: .constant(false))
    }
}
