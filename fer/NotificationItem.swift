//
//  NotificationItem.swift
//  fer
//
//  Created by MAC on 27/11/26.
//

import Foundation

struct NotificationItem: Identifiable, Hashable {
    let id: UUID = UUID()
    let sectionTitle: String
    let title: String
    let message: String
    var detailMessage: String? = nil
    let creationDate: Date
    var icon: String = "bell"
    var isRead: Bool = false
}
