class Bid {
  String projectName;
  String contractorName;
  int bidAmount;
  String bidDescription;
  String quotation;
  int estimatedCost;
  int contracotrid;

  Bid({
    required this.contracotrid,
    required this.projectName,
    required this.contractorName,
    required this.bidAmount,
    required this.bidDescription,
    required this.quotation,
    required this.estimatedCost,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
    contracotrid: json['contractor_id']??0,
    projectName: json["project_name"]??'Project',
    contractorName: json["contractor_name"]??'Bin Aziz',
    bidAmount: json["bid_amount"]??'Amount',
    bidDescription: json["bid_description"]??'Description',
    quotation: json["quotation"]??'nope',
    estimatedCost: json["estimated_cost"]??'1000000',
  );

  Map<String, dynamic> toJson() => {
    "project_name": projectName,
    "contractor_name": contractorName,
    "bid_amount": bidAmount,
    "bid_description": bidDescription,
    "quotation": quotation,
    "estimated_cost": estimatedCost,
  };
}
