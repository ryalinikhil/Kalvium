//
//  PDFViewModel.swift
//  Kalvium
//
//  Created by Sameer Nikhil on 11/11/24.
//


import Combine
import Firebase
import FirebaseFirestore
import PDFKit

class PDFViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var pdfDocument: PDFDocument? = nil
    
    var userRole: UserRole
    private var db = Firestore.firestore()
    
    init(role: UserRole) {
        self.userRole = role
        fetchPDFURL()
        listenToPageChanges()
    }
    
    private func fetchPDFURL() {
        db.collection("pdfSessions").document("sessionID").getDocument { document, error in
            if let document = document, document.exists {
                if let pdfURLString = document.data()?["url"] as? String,
                   let pdfURL = URL(string: pdfURLString),
                   let document = PDFDocument(url: pdfURL) {
                    DispatchQueue.main.async {
                        self.pdfDocument = document
                    }
                }
            } else {
                print("PDF URL not found: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    func changePage(newPage: Int) {
        if userRole == .admin {
            currentPage = newPage
            db.collection("pdfSessions").document("sessionID").setData(["currentPage": newPage], merge: true)
        }
    }

    private func listenToPageChanges() {
        db.collection("pdfSessions").document("sessionID").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            if let newPage = document.data()?["currentPage"] as? Int {
                DispatchQueue.main.async {
                    self.currentPage = newPage
                }
            }
        }
    }
}




class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()

    func updatePage(for pageNumber: Int) {
        db.collection("pdfSessions").document("session1").setData(["currentPage": pageNumber], merge: true)
    }

    func listenForPageChanges(completion: @escaping (Int) -> Void) {
        db.collection("pdfSessions").document("session1").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot, document.exists, let data = document.data() else { return }
            if let page = data["currentPage"] as? Int {
                completion(page)
            }
        }
    }
}
