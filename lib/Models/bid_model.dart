class Bid {
  String projectName;
  String contractorName;
  int bidAmount;
  String bidDescription;
  String quotation;
  int pId;
  int estimatedCost;
  int bidID;
  int contracotrid;

  Bid({
    required this.pId,
    required this.bidID,
    required this.contracotrid,
    required this.projectName,
    required this.contractorName,
    required this.bidAmount,
    required this.bidDescription,
    required this.quotation,
    required this.estimatedCost,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
    pId: json['project_id']??2,
    bidID: json['bid_id']??1,
    contracotrid: json['contractor_id']??0,
    projectName: json["project_name"]??'Project',
    contractorName: json["contractor_name"]??'Bin Aziz',
    bidAmount: json["bid_amount"]??'Amount',
    bidDescription: json["bid_description"]??'Description',
    quotation: json["quotation"]??'nope',
    estimatedCost: json["estimated_cost"]??1000000,
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
