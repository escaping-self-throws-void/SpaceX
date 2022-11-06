//
//  ImageDownloader.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

actor ImageLoader {
    private var cache = NSCache<NSString, UIImage>()
    
    static let shared = ImageLoader()

    func downloadImage(from link: String) async throws -> UIImage {
        if let cachedImage = cache.object(forKey: link as NSString) {
            return cachedImage
        }
        
        guard let url = URL(string: link) else {
            throw RequestError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.invalidResponse
        }

        guard (200..<300) ~= response.statusCode else {
            throw RequestError.invalidStatusCode(response.statusCode)
        }
        

        guard let image = UIImage(data: data) else {
            throw RequestError.unknown
        }

        cache.setObject(image, forKey: link as NSString)
        
        return image
    }
    
    private init() {}

    private func getImage(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    private func saveImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
