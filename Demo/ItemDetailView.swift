//
//  ItemDetailView.swift
//  Demo
//
//  Created by apple on 2025/02/10.
//

import SwiftUI
import PDFKit

struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text("図面 【\(item.name)】")
                .font(.largeTitle)
                .padding()
            
            PDFViewer(pdfName: item.pdfFileName)
                .frame(height: 400)  // Set a fixed height or use .fill
                .padding()
            
            Button(action: {
                            sharePDF(named: item.pdfFileName)
                        }) {
                            Label("ダウンロード", systemImage: "square.and.arrow.down")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding()
            
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// Function to share the PDF file
        private func sharePDF(named pdfName: String) {
            guard let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf") else {
                print("PDF file not found.")
                return
            }

            let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            if let topVC = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .flatMap({ $0.windows })
                .first(where: { $0.isKeyWindow })?.rootViewController {
                topVC.present(activityVC, animated: true)
            }
        }
}

struct PDFViewer: UIViewRepresentable {
    let pdfName: String  // Name of the PDF file in the bundle
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true  // Auto-scale the PDF for better readability
        if let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf") {
            pdfView.document = PDFDocument(url: url)
        }
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update the view dynamically
    }
}
