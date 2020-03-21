//
//  CheckoutView.swift
//  SwiftDishApp
//
//  Created by Alejandro Franco on 07/03/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var paymentType = 0
    let paymentTypes = ["Cash", "Credit", "Points"]
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 1
    let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var showingAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double (self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    
    var body: some View {
        Form {
            Section {
                Picker ("How do you want to pay", selection: $paymentType) {
                    ForEach(0 ..< paymentTypes.count) {
                        Text(self.paymentTypes[$0])
                    }
                }
                Toggle (isOn: $addLoyaltyDetails) {
                    Text("Add SwiftDish loyalty card")
                }
                if addLoyaltyDetails {
                    TextField("Enter your SwiftDish ID", text: $loyaltyNumber)
                }
            }
            Section (header: Text("Add tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach (0 ..< tipAmounts.count) {
                        Text("\(self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                Text("Total: $ \(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            
            ){
                Button("Confirm order") {
                    self.showingAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert (
                title: Text("Order confirmed"),
                message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
