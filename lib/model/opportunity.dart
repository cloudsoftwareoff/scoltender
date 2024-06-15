class Opportunity {
  final String id;
  final String title;
  final String description;
  List<String> material;
  final DateTime endDate;
  final String createdBy;
  final DateTime createdAt;
  final double budget;
  // 'open', 'closed', 'completed'
  final String status; 

  Opportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.material,
    required this.endDate,
    required this.createdBy,
    required this.createdAt,
    required this.budget,
    this.status = 'open',
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'material':material,
      'endDate': endDate.toIso8601String(),
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'budget': budget,
      'status': status,
    };
  }

  // Method to create an Opportunity object from a map
  factory Opportunity.fromMap(Map<String, dynamic> map) {
    return Opportunity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
        material: List<String>.from(map['material'] ?? []),
      endDate: DateTime.parse(map['endDate']),
      createdBy: map['createdBy'],
      createdAt: DateTime.parse(map['createdAt']),
      budget: map['budget'],
      status: map['status'],
    );
  }
}
