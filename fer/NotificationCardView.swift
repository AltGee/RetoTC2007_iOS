//
//  NotificationCardView.swift
//  fer
//
//  Created by MAC on 27/11/26.
//

import Foundation
import SwiftUI

struct NotificationCardView: View {
    let item: NotificationItem
    var onTap: () -> Void
    
    private var isUnread: Bool {
        !item.isRead
    }
    
    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: 12){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isUnread ? Color.ferPrimaryContainer : Color.ferSurface)
                        .frame(width: 40,height: 60)
                    
                    Image(systemName: item.icon)
                        .font(.system(size:16, weight: .semibold))
                        .foregroundColor(Color.ferPrimary)
                }
                
                VStack (alignment: .leading, spacing: 4) {
                    HStack(alignment: .center, spacing: 6) {
                        Text(item.title)
                            .font(.openSansBold(15))
                            .foregroundColor(Color.ferOnSurface)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text(item.creationDate, format: .dateTime.day().month(.abbreviated).year())
                            .font(.caption)
                            .foregroundColor(Color.ferOnSurfaceVariant)
                        
                        if isUnread {
                            Circle()
                                .fill(Color.ferPrimary)
                                .frame(width: 7,height: 7)
                        }
                    }
                    
                    Text(item.message)
                        .font(.openSansRegular(14))
                        .foregroundColor(Color.ferOnSurfaceVariant)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(isUnread ? Color.ferPrimaryContainer.opacity(0.45) : Color.ferSurface)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isUnread ? Color.ferPrimary.opacity(0.25) : Color.ferOutlineVariant, lineWidth: 1
                           )
            )
        }
        .buttonStyle(.plain)
    }
}

struct NotificationDetailSheet: View {
    let item: NotificationItem
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 12) {
                ZStack{
                    Circle()
                        .fill(Color.ferPrimary)
                        .frame(width: 44,height: 44)
                    Image(systemName: item.icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.ferSurface)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.title)
                        .font(.openSansBold(18))
                        .foregroundColor(Color.ferOnSurface)
                    
                    Text(item.creationDate, format: .dateTime.day().month(.abbreviated).year())
                        .font(.openSansRegular(12))
                        .foregroundColor(Color.ferOnSurfaceVariant)
                }
            }
            Text(item.detailMessage ?? item.message)
                .font(.openSansRegular(14))
                .foregroundColor(Color.ferOnSurface.opacity(0.88))
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                Text("Entendido")
                    .font(.openSansSemiBold(15))
                    .foregroundColor(Color.ferSurface)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.ferPrimary)
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 16)
        .background(Color.ferSurface)
        .presentationDetents([.fraction(0.42), .medium])
        .presentationDragIndicator(.visible)
    }
}
    

