//
//  ContentView.swift
//  Challenge_1_Day_19
//
//  Created by Ewanfo Lucky Peter on 21/06/2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var inputValue = 0
    
    var units = ["Seconds", "Minutes", "Hours", "Days"]
    
    var conversionResult : Int{
        
        let inputConversionMultiple: Int = getConversionMultiple(inputUnit)
        let outputConversionMultiple = getConversionMultiple(outputUnit)
        var _result = 0
        
        let inputIsInvalid : Bool = inputUnit.isEmpty || outputUnit.isEmpty
        
        if inputUnit != outputUnit && inputIsInvalid == false {
            let unitToMillseconds = inputConversionMultiple * inputValue
            
            _result = unitToMillseconds / outputConversionMultiple
            
        }
        else if inputUnit == outputUnit{
            _result = inputValue
        }
        
        return _result
    }
    
    func getConversionMultiple(_ unit : String) -> Int{
        
        var conversionMultiple = 1
        
        switch unit{
            case "Seconds":
                conversionMultiple = 1_000
            case "Minutes":
                conversionMultiple = 60_000
            case "Hours":
                conversionMultiple = 3_600_000
            case "Days":
                conversionMultiple = 86_400_000
            default:
                conversionMultiple = 1
        }
        
        return conversionMultiple
        
    }
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter Input value", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                }header: {
                    Text("Enter Input Value")
                }
                
                Section{
                    Picker("Select Input Unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select Input Unit")
                }
                
                Section{
                    Picker("Select Output Unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select Output Unit")
                }
                
                Section{
                    Text("RESULT =  \(conversionResult) \(outputUnit.lowercased())")
                }header: {
                    Text("RESULT")
                }
            }
            .navigationTitle("Unit Conversion")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
