//
//  Network+Item.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

enum ItemsApi: Endpoint {
    case item
    case itemDetail
    
    var path: String {
        switch self {
        case .item: return "store/item"
        case .itemDetail: return "store/item/details"
        }
    }
}

public extension Network {
    func item(id: ItemId) async throws -> Item {
        try await get(ItemsApi.item, queryItems: ["itemId": id])
    }
    
    func itemDetail(id: ItemId, size: ItemThumbnailSize) async throws -> Item.Detail {
        try await get(ItemsApi.itemDetail, queryItems: ["itemId": id, "thumbnailSize": size.rawValue])
    }
}
