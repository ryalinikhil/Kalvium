//
//  PDFViewer.swift
//  Kalvium
//
//  Created by Sameer Nikhil on 11/11/24.
//
import SwiftUI
import PDFKit

enum UserRole {
    case admin
    case viewer
}


import SwiftUI
import PDFKit

struct PDFViewerView: View {
    @ObservedObject var viewModel: PDFViewModel
    
    var body: some View {
        VStack {
            if let pdfDocument = viewModel.pdfDocument {
                PDFKitView(pdfDocument: pdfDocument, currentPage: $viewModel.currentPage)
                
                if viewModel.userRole == .admin {
                    HStack {
                        Button(action: {
                            let newPage = max(viewModel.currentPage - 1, 0)
                            viewModel.changePage(newPage: newPage)
                        }) {
                            Text("Previous")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            let newPage = min(viewModel.currentPage + 1, pdfDocument.pageCount - 1)
                            viewModel.changePage(newPage: newPage)
                        }) {
                            Text("Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                } else {
                    Text("Following Admin's page")
                        .padding()
                }
            } else {
                VStack{
                    ProgressView()
                        .foregroundStyle(.blue)
                    
                    Text("Loading PDF...")
                        .foregroundStyle(.blue)
                }
            }
        }
        .navigationTitle("PDF Co-Viewer")
    }
}
