//
//  Data.swift
//  Demo
//
//  Created by apple on 2025/02/10.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let pdfFileName: String
}

enum Company: String {
    case nf = "ニューフレアテクノロジー"
    case te = "東京エレクトロン"
    case nec = "NEC"
    case kd = "国際電気"
}

let sampleItems: [Item] = [
    Item(name: "NK01079G", category: Company.nf.rawValue, pdfFileName: "pdf1"),
    Item(name: "A2109061", category: Company.nf.rawValue, pdfFileName: "pdf2"),
    Item(name: "1308-SK-1403", category: Company.te.rawValue, pdfFileName: "pdf3"),
    Item(name: "1404-SK-1401", category: Company.te.rawValue, pdfFileName: "pdf4"),
    Item(name: "1202-KS-2002B", category: Company.te.rawValue, pdfFileName: "pdf5"),
    Item(name: "GXA-R15107-GRP-00", category: Company.nec.rawValue, pdfFileName: "pdf6"),
    Item(name: "A4VX05936", category: Company.kd.rawValue, pdfFileName: "pdf7")
]


var groupedItems: [String: [Item]] {
    Dictionary(grouping: sampleItems, by: { $0.category })
}
