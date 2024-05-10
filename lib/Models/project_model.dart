class Project {
  final int pId;
  final String pName;
  final String pDetails;
  final dynamic pEstimatedCost;
  final dynamic pAssgnCid;
  final String pCategory;
  final String pType;
  final String pMode;
  final bool pQa;
  final String pListing;
  final int pFloors;
  final String pArea;
  final int pLivingArea;
  final int pWashroom;
  final int pKitchen;
  final String pStatus;
  final double pLatitude;
  final double pLongitude;
  final String pBudget;

  Project({
    required this.pId,
    required this.pName,
    required this.pDetails,
    required this.pEstimatedCost,
    required this.pAssgnCid,
    required this.pCategory,
    required this.pType,
    required this.pMode,
    required this.pQa,
    required this.pListing,
    required this.pFloors,
    required this.pArea,
    required this.pLivingArea,
    required this.pWashroom,
    required this.pKitchen,
    required this.pStatus,
    required this.pLatitude,
    required this.pLongitude,
    required this.pBudget,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      pId: json['p_id'] as int,
      pName: json['p_name'] as String,
      pDetails: json['p_details'] as String,
      pEstimatedCost: json['p_estimated_cost'],
      pAssgnCid: json['p_assgn_cid'],
      pCategory: json['p_category'] as String,
      pType: json['p_type'] as String,
      pMode: json['p_mode'] as String,
      pQa: json['p_qa'] as bool,
      pListing: json['p_listing'] as String,
      pFloors: json['p_floors'] as int,
      pArea: json['p_area'] as String,
      pLivingArea: json['p_living_area'] as int,
      pWashroom: json['p_washroom'] as int,
      pKitchen: json['p_kitchen'] as int,
      pStatus: json['p_status'] as String,
      pLatitude: json['p_latitude'] as double,
      pLongitude: json['p_longitude'] as double,
      pBudget: json['p_budget'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_id': pId,
      'p_name': pName,
      'p_details': pDetails,
      'p_estimated_cost': pEstimatedCost,
      'p_assgn_cid': pAssgnCid,
      'p_category': pCategory,
      'p_type': pType,
      'p_mode': pMode,
      'p_qa': pQa,
      'p_listing': pListing,
      'p_floors': pFloors,
      'p_area': pArea,
      'p_living_area': pLivingArea,
      'p_washroom': pWashroom,
      'p_kitchen': pKitchen,
      'p_status': pStatus,
      'p_latitude': pLatitude,
      'p_longitude': pLongitude,
      'p_budget': pBudget,
    };
  }
}
