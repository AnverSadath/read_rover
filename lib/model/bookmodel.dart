// To parse this JSON data, do
//
//     final readApiResponce = readApiResponceFromJson(jsonString);

import 'dart:convert';

ReadApiResponce readApiResponceFromJson(String str) =>
    ReadApiResponce.fromJson(json.decode(str));

String readApiResponceToJson(ReadApiResponce data) =>
    json.encode(data.toJson());

class ReadApiResponce {
  String? kind;
  int? totalItems;
  List<Item>? items;

  ReadApiResponce({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory ReadApiResponce.fromJson(Map<String, dynamic> json) =>
      ReadApiResponce(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Kind? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] == null
            ? null
            : VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null
            ? null
            : SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null
            ? null
            : AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toJson(),
        "saleInfo": saleInfo?.toJson(),
        "accessInfo": accessInfo?.toJson(),
        "searchInfo": searchInfo?.toJson(),
      };
}

class AccessInfo {
  Country? country;
  Viewability? viewability;
  bool? embeddable;
  bool? publicDomain;
  TextToSpeechPermission? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  AccessViewStatus? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: countryValues.map[json["country"]] ?? Country.IN,
      viewability:
          viewabilityValues.map[json["viewability"]] ?? Viewability.NO_PAGES,
      embeddable: json["embeddable"] ?? false,
      publicDomain: json["publicDomain"] ?? false,
      textToSpeechPermission:
          textToSpeechPermissionValues.map[json["textToSpeechPermission"]] ??
              TextToSpeechPermission.ALLOWED,
      epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
      pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
      webReaderLink: json["webReaderLink"] ?? "",
      accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]] ??
          AccessViewStatus.NONE,
      quoteSharingAllowed: json["quoteSharingAllowed"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission":
            textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub?.toJson(),
        "pdf": pdf?.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

enum AccessViewStatus { NONE, SAMPLE }

final accessViewStatusValues = EnumValues(
    {"NONE": AccessViewStatus.NONE, "SAMPLE": AccessViewStatus.SAMPLE});

enum Country { IN }

final countryValues = EnumValues({"IN": Country.IN});

class Epub {
  bool? isAvailable;
  String? acsTokenLink;

  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
      };
}

enum TextToSpeechPermission { ALLOWED, ALLOWED_FOR_ACCESSIBILITY }

final textToSpeechPermissionValues = EnumValues({
  "ALLOWED": TextToSpeechPermission.ALLOWED,
  "ALLOWED_FOR_ACCESSIBILITY": TextToSpeechPermission.ALLOWED_FOR_ACCESSIBILITY
});

enum Viewability { NO_PAGES, PARTIAL }

final viewabilityValues = EnumValues(
    {"NO_PAGES": Viewability.NO_PAGES, "PARTIAL": Viewability.PARTIAL});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({"books#volume": Kind.BOOKS_VOLUME});

class SaleInfo {
  Country? country;
  Saleability? saleability;
  bool? isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]] ?? Country.IN,
        saleability:
            saleabilityValues.map[json["saleability"]] ?? Saleability.FOR_SALE,
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"],
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
        "buyLink": buyLink,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class SaleInfoListPrice {
  double? amount;
  String? currencyCode;

  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"]?.toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  int? finskyOfferType;
  OfferListPrice? listPrice;
  OfferListPrice? retailPrice;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: json["listPrice"] == null
            ? null
            : OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : OfferListPrice.fromJson(json["retailPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
      };
}

class OfferListPrice {
  int? amountInMicros;
  String? currencyCode;

  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

enum Saleability { FOR_SALE, NOT_FOR_SALE }

final saleabilityValues = EnumValues({
  "FOR_SALE": Saleability.FOR_SALE,
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  String? textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  PrintType? printType;
  List<String>? categories;
  int? averageRating;
  int? ratingsCount;
  MaturityRating? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  Language? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "",
        authors: List<String>.from(json["authors"] ?? []),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null
            ? []
            : List<IndustryIdentifier>.from(json["industryIdentifiers"]!
                .map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: json["readingModes"] == null
            ? null
            : ReadingModes.fromJson(json["readingModes"]),
        pageCount: (json["pageCount"] as num?)?.toInt(),
        printType: printTypeValues.map[json["printType"]]!,
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        averageRating: (json["averageRating"] as num?)?.toInt(),
        ratingsCount: json["ratingsCount"],
        maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromJson(json["imageLinks"]),
        language: languageValues.map[json["language"]] ?? Language.EN,
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors,
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers": industryIdentifiers == null
            ? []
            : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
        "readingModes": readingModes?.toJson(),
        "pageCount": pageCount,
        "printType": printTypeValues.reverse[printType],
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  Type? type;
  String? identifier;

  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: typeValues.map[json["type"]]!,
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
      };
}

enum Type { ISBN_10, ISBN_13, OTHER }

final typeValues = EnumValues(
    {"ISBN_10": Type.ISBN_10, "ISBN_13": Type.ISBN_13, "OTHER": Type.OTHER});

enum Language { EN, HI }

final languageValues = EnumValues({"en": Language.EN, "hi": Language.HI});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues =
    EnumValues({"NOT_MATURE": MaturityRating.NOT_MATURE});

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({"BOOK": PrintType.BOOK});

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
