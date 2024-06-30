// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPublishedSpecialProjectsQuery: GraphQLQuery {
  public static let operationName: String = "GetPublishedSpecialProjects"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPublishedSpecialProjects { specialProjects { __typename nodes { __typename title images { __typename url } } } }"#
    ))

  public init() {}

  public struct Data: PomoschAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PomoschAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("specialProjects", SpecialProjects?.self),
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
      ] }

      /// A flattened list of the nodes.
      public var nodes: [Node]? { __data["nodes"] }

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
    }
  }
}
