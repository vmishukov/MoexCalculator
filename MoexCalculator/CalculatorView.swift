//
//  CalculatroView.swift
//  MoexCalculator
//
//  Created by Vladislav Mishukov on 02.03.2024.
//

import SwiftUI

struct CalculatroView: View {
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        List {
            HStack {
                VStack {
                    Text(viewModel.topCurrency.flag)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Text(viewModel.topCurrency.rawValue)
                        .font(.title2)
                }
                .frame(height: 100)
                
                TextField("", value: $viewModel.topAmount, formatter: numberFormatter)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.5)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                VStack {
                    Text(viewModel.bottomCurrency.flag)
                        .font(.system(size:200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Text(viewModel.bottomCurrency.rawValue)
                        .font(.title2)
                }
                
                .frame(height: 100)
                
                TextField("", value: $viewModel.bottomAmount, formatter: numberFormatter)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .minimumScaleFactor(0.5)
                    .keyboardType(.numberPad)
            }
        }
    }
    
    var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.usesGroupingSeparator = false
        nf.maximumFractionDigits = 2
        return nf
    }()
}

struct CalculatorView_Preview: PreviewProvider {
    static var previews: some View {
        CalculatroView(viewModel: CalculatorViewModel())
    }
}
