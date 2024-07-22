// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPublishedSpecialProjectsQuery: GraphQLQuery {
  public static let operationName: String = "GetPublishedSpecialProjects"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPublishedSpecialProjects($first: Int, $after: String) { specialProjects(first: $first, after: $after) { __typename nodes { __typename title images { __typename url } } pageInfo { __typename hasNextPage hasPreviousPage startCursor endCursor } totalCount } }"#
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
      .field("specialProjects", SpecialProjects?.self, arguments: [
        "first": .variable("first"),
        "after": .variable("after")
      ]),
    ] }

    /// Возвращает спецпроекты
    public var specialProjects: SpecialProjects? { __data["specialProjects"] }

    /// SpecialProjects
    ///
    /// Parent Type: `SpecialProjectsConnection`
    public struct SpecialProjects: PomoschAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.SpecialProjectsConnection }
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

      /// SpecialProjects.Node
      ///
      /// Parent Type: `SpecialProject`
      public struct Node: PomoschAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.SpecialProject }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("title", String.self),
          .field("images", [Image].self),
        ] }

        /// Название
        public var title: String { __data["title"] }
        /// Изображения
        public var images: [Image] { __data["images"] }

        /// SpecialProjects.Node.Image
        ///
        /// Parent Type: `FileInformation`
        public struct Image: PomoschAPI.SelectionSet {
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

      /// SpecialProjects.PageInfo
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
