//
//  ContentView.swift
//  Day1
//
//  Created by Rohan Sakhare on 15/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var noOfPeople = 1
    @State private var tipPercentage = 20
    let tipPercentages = [10 , 15, 20 , 25 ,0]
    var body: some View {
        NavigationView {
            Form {
                Section(header : Text("Enter the Amount").bold().foregroundStyle(.blue)){
                    TextField("Amount", value: $checkAmount, format: .currency(code: "usd") )
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Total Amount").bold().foregroundStyle(.blue)){
                    Text(checkAmount, format: .currency(code: "usd") )
                        
                }
                Section(header: Text("Number of People").bold().foregroundStyle(.blue)) {
                    Stepper(value: $noOfPeople, in: 1...20) {
                        Text("Number of People: \(noOfPeople)")
                    }
                }
                Section(header: Text("Select Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage ) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(.white)
                }


            }
            .navigationBarTitle("Tip Calculator").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
