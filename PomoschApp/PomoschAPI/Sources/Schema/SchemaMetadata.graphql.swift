// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PomoschAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PomoschAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PomoschAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PomoschAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return PomoschAPI.Objects.Query
    case "WardsConnection": return PomoschAPI.Objects.WardsConnection
    case "Ward": return PomoschAPI.Objects.Ward
    case "WardPublicInformation": return PomoschAPI.Objects.WardPublicInformation
    case "Nomen": return PomoschAPI.Objects.Nomen
    case "FileInformation": return PomoschAPI.Objects.FileInformation
    case "FileUploadInformation": return PomoschAPI.Objects.FileUploadInformation
    case "PageInfo": return PomoschAPI.Objects.PageInfo
    case "SpecialProjectsConnection": return PomoschAPI.Objects.SpecialProjectsConnection
    case "SpecialProject": return PomoschAPI.Objects.SpecialProject
    case "LimitedLiabilityCompanyReport": return PomoschAPI.Objects.LimitedLiabilityCompanyReport
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
