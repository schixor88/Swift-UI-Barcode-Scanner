//
//  ScannerView.swift
//  BarScanner
//
//  Created by Kushagra Acharya on 14/03/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode:String
    @Binding var alertItem : AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC.init(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView:self)
    }
    
    class Coordinator:NSObject,ScannerVCDelegate{
        
        private let scannerView:ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedValue
            }
        }
    }
   
}


//
//#Preview {
//    ScannerView(scannedCode: .constant(""),alertItem: .constant(AlertItem(title: "hi", message: "hi", dismissButton: <#T##Alert.Button#>)))
//}
