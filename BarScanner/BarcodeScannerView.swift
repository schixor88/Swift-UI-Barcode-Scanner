//
//  ContentView.swift
//  BarScanner
//
//  Created by Kushagra Acharya on 14/03/2024.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id = UUID()
    let title:String
    let message:String
    let dismissButton:Alert.Button
}

struct AlertContext{
    static let invalidDeviceInput = AlertItem(title: "Invalid Device", message: "Sorry couldnt initialize camera", dismissButton: .default(Text("Ok")))
    static let invalidScannedValue = AlertItem(title: "Invalid Scan", message: "Sorry couldnt scan QR", dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode:String = ""
//    @State var isShowingAlert:Bool = false
    @State private var alertItem:AlertItem?
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem).frame(
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
//            .alert(isPresented: $isShowingAlert, content: {
//                Alert(title: Text("Test"), message: Text("This is a test"),dismissButton: .default(Text("Ok")))
//            })
            .alert(item: $alertItem){
                alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
            .padding()
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
