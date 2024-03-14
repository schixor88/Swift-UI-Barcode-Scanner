//
//  ContentView.swift
//  BarScanner
//
//  Created by Kushagra Acharya on 14/03/2024.
//

import SwiftUI

struct AlertItem{
    let title:String
    let message:String
    let dismissButton:Alert.Button
}

struct AlertContext{
    static let invalideviceInput = AlertItem(title: "Invalid Device", message: "Sorry couldnt initialize camera", dismissButton: <#T##Alert.Button#>)
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode:String = ""
//    @State var isShowingAlert:Bool = false
    @State private var alertItem:AlertItem?
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(scannedCode: $scannedCode).frame(
                    maxWidth:.infinity,
                    maxHeight:300
                )
                Spacer().frame(height:60)
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder").font(.title2).padding()
            
                Text(scannedCode.isEmpty ? "Not yet scanned": scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? Color.red : Color.green)
                    .padding()
//                
//                Button {
//                    isShowingAlert = true
//                }label: {
//                    Label("Reset",systemImage: "arrow.uturn.backward")
//                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(isPresented: $isShowingAlert, content: {
                Alert(title: Text("Test"), message: Text("This is a test"),dismissButton: .default(Text("Ok")))
            })
            .padding()
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
