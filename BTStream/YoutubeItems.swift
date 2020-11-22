import UIKit

struct Yvideo: Codable {
    //let pageInfo:[String: Int]
    let items:[Item]
}

struct Item: Codable {
    let id: [String:String]
    let snippet:Detail

}
struct Detail: Codable {
    let publishedAt: String
    let title: String
    let description: String
    let thumbnails:Thumbnail
}


struct Thumbnail: Codable {
    let medium:ThumURL
    let high:ThumURL
}

struct ThumURL: Codable {
    let url:String
}
