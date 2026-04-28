//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Алиса on 13/03/26.
//

import UIKit

extension ReminderViewController {
    nonisolated enum Row: Hashable, Sendable {
        case date
        case notes
        case time
        case title
        
        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .notes: return "square.and.pencil"
            case .time: return "clock"
            case .title: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName else {
                return nil
            }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
