class Bid {
  final String id;
  final String opportunityId;
  final String contractorId;
  final double amount;
  final DateTime createdAt;
   // 'pending', 'accepted', 'rejected'
  final String status;

  Bid({
    required this.id,
    required this.opportunityId,
    required this.contractorId,
    required this.amount,
    required this.createdAt,
    this.status = 'pending',
  });

  // Method to convert Bid object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'opportunityId': opportunityId,
      'contractorId': contractorId,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }

  // Method to create a Bid object from a map
  factory Bid.fromMap(Map<String, dynamic> map) {
    return Bid(
      id: map['id'],
      opportunityId: map['opportunityId'],
      contractorId: map['contractorId'],
      amount: map['amount'],
      createdAt: DateTime.parse(map['createdAt']),
      status: map['status'],
    );
  }
}
