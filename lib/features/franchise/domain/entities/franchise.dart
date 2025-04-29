class Franchise {
  final String id;
  final String ownerId; // ID пользователя-франчайзера
  final String name;
  final String description;
  final String industry;
  final String city;
  final double startupCost; // начальные инвестиции
  final double royaltyPercent;
  final DateTime createdAt;
  final String status;

  Franchise({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.industry,
    required this.city,
    required this.startupCost,
    required this.royaltyPercent,
    required this.createdAt,
    this.status = 'pending',
  });
}
