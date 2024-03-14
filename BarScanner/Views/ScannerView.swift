//
//  ScannerView.swift
//  BarScanner
//
//  Created by Kushagra Acharya on 14/03/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode:String
    
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
            print(error.rawValue)
        }
    }
   
}



#Preview {
    ScannerView(scannedCode: .constant(""))
}
