//
//  RoleSelectionView.swift
//  Kalvium
//
//  Created by Sameer Nikhil on 11/11/24.
//

import SwiftUI
import PDFKit

struct RoleSelectionView: View {
    @State private var selectedRole: UserRole? = nil
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Select Role")
                .font(.title)
                .padding()
            
            VStack {
                Button(action: {
                    selectedRole = .admin
                }) {
                    Text("Admin")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    selectedRole = .viewer
                }) {
                    Text("Viewer")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            Spacer()
            
            if let role = selectedRole {
                NavigationLink(
                    destination: PDFViewerView(viewModel: PDFViewModel(role: role)),
                    isActive: .constant(true)
                ) {
                    EmptyView()
                }
            }
        }
        .navigationTitle("Role Selection")
    }
}
