//
//  PDFKitView.swift
//  Kalvium
//
//  Created by Sameer Nikhil on 11/11/24.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {
        if let page = pdfDocument.page(at: currentPage) {
            pdfView.go(to: page)
        }
    }
}
