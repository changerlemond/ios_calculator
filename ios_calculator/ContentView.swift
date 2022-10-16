//
//  ContentView.swift
//  ios_calculator
//
//  Created by jungclaire on 2022/10/15.
//

import SwiftUI

enum ButtonType: String {
    case first, second, third, fourth, fifth, sixth, seventh, eighth, nineth, zero
    case dot, equal, plus, minus, multiple, devide
    case percent, opposite, clear
    
    var buttonDisplayName: String {
        switch self {
        case .first :
            return "1"
        case .second :
            return "2"
        case .third :
            return "3"
        case .fourth :
            return "4"
        case .fifth :
            return "5"
        case .sixth :
            return "6"
        case .seventh :
            return "7"
        case .eighth :
            return "8"
        case .nineth :
            return "9"
        case .zero :
            return "0"
        case .dot :
            return "."
        case .equal :
            return "="
        case .plus :
            return "+"
        case .multiple :
            return "X"
        case .devide :
            return "÷"
        case .opposite :
            return "÷/-"
        case .percent :
            return "%"
        case .clear :
            return "C"
        default:
            return "?"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .dot:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiple, .devide:
            return Color.orange
        case .percent, .opposite, .clear:
            return Color.gray
        default:
            return Color.gray
        }
    }
    
    var forgroundColor: Color {
        switch self {
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .nineth, .dot, .equal, .plus, .minus, .multiple, .devide:
            return Color.white
        case .percent, .opposite, .clear:
            return Color.black
        default:
            return Color.black
        }
    }
    
}

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .devide],
        [.seventh, .eighth, .nineth, .multiple],
        [.fourth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .zero, .dot, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                }
                
                ForEach(buttonData, id: \.self) {
                    line in
                    HStack {
                        ForEach(line, id: \.self) {
                            item in
                            Button {
                                if (totalNumber != "0" && item.backgroundColor == Color("NumberButton")) {
                                    totalNumber += item.buttonDisplayName
                                } else if (totalNumber == "0" && item.backgroundColor == Color("NumberButton")) {
                                    totalNumber = item.buttonDisplayName
                                } else if (item.buttonDisplayName == "C") {
                                    totalNumber = "0"
                                }
                            } label: {
                                Text(item.buttonDisplayName)
                                    .frame(width: 80,
                                           height: 80)
                                    .background(item.backgroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.forgroundColor)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
