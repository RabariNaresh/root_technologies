class CarouselModal {
  String name;
  String logo;
  String description;
  List<String> featuredImages;

  CarouselModal({
    required this.name,
    required this.logo,
    required this.description,
    required this.featuredImages,
  });

  factory CarouselModal.fromJson(Map<String, dynamic> json) => CarouselModal(
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        featuredImages: List<String>.from(
          json["featured_images"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
        "description": description,
        "featured_images": List<dynamic>.from(
          featuredImages.map((x) => x),
        ),
      };
}
