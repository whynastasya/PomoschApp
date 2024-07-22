// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPublishedWardsQuery: GraphQLQuery {
  public static let operationName: String = "GetPublishedWards"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPublishedWards($first: Int, $after: String) { wards(first: $first, after: $after) { __typename nodes { __typename publicInformation { __typename name { __typename fullName } photo { __typename url } } } pageInfo { __typename hasNextPage hasPreviousPage startCursor endCursor } totalCount } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var after: GraphQLNullable<String>

  public init(
    first: GraphQLNullable<Int>,
    after: GraphQLNullable<String>
  ) {
    self.first = first
    self.after = after
  }

  public var __variables: Variables? { [
    "first": first,
    "after": after
  ] }

  public struct Data: PomoschAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wards", Wards?.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after")
      ]),
    ] }

    /// Подопечные
    public var wards: Wards? { __data["wards"] }

    /// Wards
    ///
    /// Parent Type: `WardsConnection`
    public struct Wards: PomoschAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.WardsConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node]?.self),
        .field("pageInfo", PageInfo.self),
        .field("totalCount", Int.self),
      ] }

      /// A flattened list of the nodes.
      public var nodes: [Node]? { __data["nodes"] }
      /// Information to aid in pagination.
      public var pageInfo: PageInfo { __data["pageInfo"] }
      /// Identifies the total count of items in the connection.
      public var totalCount: Int { __data["totalCount"] }

      /// Wards.Node
      ///
      /// Parent Type: `Ward`
      public struct Node: PomoschAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.Ward }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("publicInformation", PublicInformation.self),
        ] }

        /// Общедоступная информация о подопечном
        public var publicInformation: PublicInformation { __data["publicInformation"] }

        /// Wards.Node.PublicInformation
        ///
        /// Parent Type: `WardPublicInformation`
        public struct PublicInformation: PomoschAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.WardPublicInformation }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", Name.self),
            .field("photo", Photo.self),
          ] }

          /// Имя
          public var name: Name { __data["name"] }
          /// Фотография подопечного
          public var photo: Photo { __data["photo"] }

          /// Wards.Node.PublicInformation.Name
          ///
          /// Parent Type: `Nomen`
          public struct Name: PomoschAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.Nomen }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("fullName", String.self),
            ] }

            /// Полное имя (Имя Отчество Фамилия)
            public var fullName: String { __data["fullName"] }
          }

          /// Wards.Node.PublicInformation.Photo
          ///
          /// Parent Type: `FileInformation`
          public struct Photo: PomoschAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.FileInformation }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", String.self),
            ] }

            /// Ссылка для отображения или скачивания файла
            public var url: String { __data["url"] }
          }
        }
      }

      /// Wards.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: PomoschAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasNextPage", Bool.self),
          .field("hasPreviousPage", Bool.self),
          .field("startCursor", String?.self),
          .field("endCursor", String?.self),
        ] }

        /// Indicates whether more edges exist following the set defined by the clients arguments.
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// Indicates whether more edges exist prior the set defined by the clients arguments.
        public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        /// When paginating backwards, the cursor to continue.
        public var startCursor: String? { __data["startCursor"] }
        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? { __data["endCursor"] }
      }
    }
  }
}
