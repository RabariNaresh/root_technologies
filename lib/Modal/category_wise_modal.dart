class CategoryWiseModal {
  List<Doc> docs;
  int totalItems;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  int nextPage;

  CategoryWiseModal({
    required this.docs,
    required this.totalItems,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  factory CategoryWiseModal.fromJson(Map<String, dynamic> json) => CategoryWiseModal(
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    totalItems: json["total_items"],
    limit: json["limit"],
    totalPages: json["total_pages"],
    page: json["page"],
    pagingCounter: json["paging_counter"],
    hasPrevPage: json["has_prev_page"],
    hasNextPage: json["has_next_page"],
    prevPage: json["prev_page"],
    nextPage: json["next_page"],
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "total_items": totalItems,
    "limit": limit,
    "total_pages": totalPages,
    "page": page,
    "paging_counter": pagingCounter,
    "has_prev_page": hasPrevPage,
    "has_next_page": hasNextPage,
    "prev_page": prevPage,
    "next_page": nextPage,
  };
}

class Doc {
  String productId;
  String title;
  String thumbnail;
  List<Image> images;
  Store store;

  Doc({
    required this.productId,
    required this.title,
    required this.thumbnail,
    required this.images,
    required this.store,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    productId: json["product_id"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    store: Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "title": title,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "store": store.toJson(),
  };
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Store {
  Name name;

  Store({
    required this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
  };
}

enum Name {
  MISHTHI_CHAI,
  RANI_CLOTHES
}

final nameValues = EnumValues({
  "Mishthi Chai": Name.MISHTHI_CHAI,
  "Rani Clothes": Name.RANI_CLOTHES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
