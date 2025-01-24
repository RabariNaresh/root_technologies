class CategoryModal {
  List<Doc> docs;
  int totalItems;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  CategoryModal({
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

  factory CategoryModal.fromJson(Map<String, dynamic> json) => CategoryModal(
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
  String title;
  String storeCategoryId;
  String coverImage;

  Doc({
    required this.title,
    required this.storeCategoryId,
    required this.coverImage,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        title: json["title"],
        storeCategoryId: json["store_category_id"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "store_category_id": storeCategoryId,
        "cover_image": coverImage,
      };
}
