import 'dart:convert';

class Project {
  int? pId;
  String? pName;
  String? pDetails;
  int? pEstimatedCost;
  int? pAssgnCid;
  String? pCategory;
  String? pType;
  String? pMode;
  bool? pQa;
  String? pListing;
  int? pFloors;
  String? pArea;
  int? pLivingArea;
  int? pWashroom;
  int? pKitchen;
  String? pStatus;
  double? pLatitude;
  double? pLongitude;
  String? pBudget;
  int? mediaId;
  String? projectId;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? model3d;

  Project({
    this.pId,
    this.pName,
    this.pDetails,
    this.pEstimatedCost,
    this.pAssgnCid,
    this.pCategory,
    this.pType,
    this.pMode,
    this.pQa,
    this.pListing,
    this.pFloors,
    this.pArea,
    this.pLivingArea,
    this.pWashroom,
    this.pKitchen,
    this.pStatus,
    this.pLatitude,
    this.pLongitude,
    this.pBudget,
    this.mediaId,
    this.projectId,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.model3d,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    pId: json['p_id'],
    pName: json['p_name'],
    pDetails: json['p_details'],
    pEstimatedCost: json['p_estimated_cost'],
    pAssgnCid: json['p_assgn_cid'],
    pCategory: json['p_category'],
    pType: json['p_type'],
    pMode: json['p_mode'],
    pQa: json['p_qa'],
    pListing: json['p_listing'],
    pFloors: json['p_floors'],
    pArea: json['p_area'],
    pLivingArea: json['p_living_area'],
    pWashroom: json['p_washroom'],
    pKitchen: json['p_kitchen'],
    pStatus: json['p_status'],
    pLatitude: json['p_latitude'],
    pLongitude: json['p_longitude'],
    pBudget: json['p_budget']??'',
    mediaId: json['media_id']??0,
    projectId: json['project_id'].toString()??'',
    image1: json['image_1']??'',
    image2: json['image_2']??'',
    image3: json['image_3']??'',
    image4: json['image_4']??'',
    image5: json['image_5']??'',
    model3d: json['model_3d']??'',
  );

  Map<String, dynamic> toJson() => {
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
    'media_id': mediaId,
    'project_id': projectId,
    'image_1': image1,
    'image_2': image2,
    'image_3': image3,
    'image_4': image4,
    'image_5': image5,
    'model_3d': model3d,
  };
}
