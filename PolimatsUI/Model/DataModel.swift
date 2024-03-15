//
//  DataModel.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import Foundation

// MARK: - Model
struct WordPressData: Codable, Identifiable, Equatable, Hashable {
    
    let id: Int
    let date, dateGmt: String
    let guid: GUID
    let modified, modifiedGmt, slug: String
    let status: StatusEnum
    let type: TypeEnum
    let link: String
    let title: GUID
    let content, excerpt: Content
    let author, featuredMedia: Int
    let commentStatus, pingStatus: Status
    let sticky: Bool
    let template: String
    let format: Format
    let meta: Meta
    let categories: [Int]
    let tags: [JSONAny]
    let featuredImageSrc: String
    let authorInfo: AuthorInfo
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, date
        case dateGmt = "date_gmt"
        case guid, modified
        case modifiedGmt = "modified_gmt"
        case slug, status, type, link, title, content, excerpt, author
        case featuredMedia = "featured_media"
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case sticky, template, format, meta, categories, tags
        case featuredImageSrc = "featured_image_src"
        case authorInfo = "author_info"
        case links = "_links"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: WordPressData, rhs: WordPressData) -> Bool {
        return lhs.id == rhs.id
    }
}

struct exData {
    
    static let exArticle = WordPressData(id: 01, date: "2023-07-25T14:52:14", dateGmt: "2023-07-25T11:52:14", guid: .init(rendered: "https://polimats.com/?p=3896"), modified: "2023-07-25T23:18:34", modifiedGmt: "2023-07-25T20:18:34", slug: "oppenheimer-2022-tarihin-bastan-yazilisi", status: .publish, type: .post, link: "https://polimats.com/oppenheimer-2022-tarihin-bastan-yazilisi/", title: .init(rendered: "Oppenheimer (2022): Tarihin Baştan Yazılışı"), content: .init(rendered: Constants.content, protected: false), excerpt: .init(rendered: "<p>Oppenheimer, beklediğiniz gibi bir film değil. 45 yıllık bir zaman dilimi. Güç ve etik, akıl ve vicdan, politika ve bilim. Tarihin kırılma noktalarından birini çevreleyen paradoksları, baş karakterin gözünden izliyoruz. </p> ", protected: false), author: 4, featuredMedia: 3898, commentStatus: .closed, pingStatus: .closed, sticky: false, template: "", format: .standard, meta: .init(inlineFeaturedImage: false, ubCttVia: "", footnotes: ""), categories: [7], tags: [], featuredImageSrc: "https://polimats.com/wp-content/uploads/Oppenheimer.jpeg", authorInfo: .init(displayName: "Arda Ilgaz", authorLink: "https://polimats.com/yazar/ilgazarda/"), links: .init(linksSelf: .init(), collection: .init(), about: .init(), author: .init(), replies: .init(), versionHistory: .init(), wpFeaturedmedia: .init(), wpAttachment: .init(), wpTerm: .init(), curies: .init()))
    
    static let exArticle2 = WordPressData(id: 01, date: "2023-07-25T14:52:14", dateGmt: "2023-07-25T11:52:14", guid: .init(rendered: "https://polimats.com/?p=3896"), modified: "2023-07-25T23:18:34", modifiedGmt: "2023-07-25T20:18:34", slug: "oppenheimer-2022-tarihin-bastan-yazilisi", status: .publish, type: .post, link: "https://polimats.com/oppenheimer-2022-tarihin-bastan-yazilisi/", title: .init(rendered: "Kredi Kartı Puanlarınızı Nasıl Düşük Komisyonla Nakite Çevirebilirsiniz"), content: .init(rendered: Constants.content, protected: false), excerpt: .init(rendered: "<p>Oppenheimer, beklediğiniz gibi bir film değil. 45 yıllık bir zaman dilimi. Güç ve etik, akıl ve vicdan, politika ve bilim. Tarihin kırılma noktalarından birini çevreleyen paradoksları, baş karakterin gözünden izliyoruz. </p> ", protected: false), author: 4, featuredMedia: 3898, commentStatus: .closed, pingStatus: .closed, sticky: false, template: "", format: .standard, meta: .init(inlineFeaturedImage: false, ubCttVia: "", footnotes: ""), categories: [7], tags: [], featuredImageSrc: "https://polimats.com/wp-content/uploads/Oppenheimer.jpeg", authorInfo: .init(displayName: "Arda Ilgaz", authorLink: "https://polimats.com/yazar/ilgazarda/"), links: .init(linksSelf: .init(), collection: .init(), about: .init(), author: .init(), replies: .init(), versionHistory: .init(), wpFeaturedmedia: .init(), wpAttachment: .init(), wpTerm: .init(), curies: .init()))
    

    
}

// MARK: - AuthorInfo
struct AuthorInfo: Codable {
    let displayName: String
    let authorLink: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case authorLink = "author_link"
    }
}

enum Status: String, Codable {
    case closed = "closed"
    case statusOpen = "open"
}

// MARK: - Content
struct Content: Codable {
    let rendered: String
    let protected: Bool
}

enum Format: String, Codable {
    case standard = "standard"
}

// MARK: - GUID
struct GUID: Codable {
    let rendered: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, collection, about: [About]
    let author, replies: [Author]
    let versionHistory: [VersionHistory]
    let wpFeaturedmedia: [Author]
    let wpAttachment: [About]
    let wpTerm: [WpTerm]
    let curies: [Cury]

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case collection, about, author, replies
        case versionHistory = "version-history"
        case wpFeaturedmedia = "wp:featuredmedia"
        case wpAttachment = "wp:attachment"
        case wpTerm = "wp:term"
        case curies
    }
}

// MARK: - About
struct About: Codable {
    let href: String
}

// MARK: - Author
struct Author: Codable {
    let embeddable: Bool
    let href: String
}

// MARK: - Cury
struct Cury: Codable {
    let name: Name
    let href: Href
    let templated: Bool
}

enum Href: String, Codable {
    case httpsAPIWOrgRel = "https://api.w.org/{rel}"
}

enum Name: String, Codable {
    case wp = "wp"
}

// MARK: - VersionHistory
struct VersionHistory: Codable {
    let count: Int
    let href: String
}

// MARK: - WpTerm
struct WpTerm: Codable {
    let taxonomy: Taxonomy
    let embeddable: Bool
    let href: String
}

enum Taxonomy: String, Codable {
    case category = "category"
    case postTag = "post_tag"
}

// MARK: - Meta
struct Meta: Codable {
    let inlineFeaturedImage: Bool
    let ubCttVia, footnotes: String

    enum CodingKeys: String, CodingKey {
        case inlineFeaturedImage = "inline_featured_image"
        case ubCttVia = "ub_ctt_via"
        case footnotes
    }
}

enum StatusEnum: String, Codable {
    case publish = "publish"
}

enum TypeEnum: String, Codable {
    case post = "post"
}

typealias WordPress = [WordPressData]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
            
        }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

