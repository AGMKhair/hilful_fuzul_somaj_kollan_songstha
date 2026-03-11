class ProjectHighlight {
  final String id;
  final String name;
  final String address;
  final String details;
  final String? imageUrl;

  ProjectHighlight({
    required this.id,
    required this.name,
    required this.address,
    required this.details,
    this.imageUrl,
  });
}
