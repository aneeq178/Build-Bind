class Contractor {
  int contractorId;
  int noOfEmployees;
  int userId; // Renamed from user_id
  String contractorType; // No change
  String description; // No change
  String contractorRating; // Renamed from contractor_rating
  int companyId; // Renamed from company_id
  String companyName; // Renamed from company_name
  String companyEmail; // Renamed from company_email
  int companyNtn; // Renamed from company_ntn
  String representativeName; // Renamed from representative_name
  String representativePosition; // Renamed from representative_position
  String representativeCnic; // No change (can be null)
  String companyPecLicense; // No change
  String rFcnic; // Renamed from r_fcnic
  String rBcnic; // Renamed from r_bcnic
  String status; // No change
  String tokens; // No change (can be null)
  int totalProjects; // Renamed from total_projects

  Contractor({
    required this.contractorId,
    required this.noOfEmployees,
    required this.userId,
    required this.contractorType,
    required this.description,
    required this.contractorRating,
    required this.companyId,
    required this.companyName,
    required this.companyEmail,
    required this.companyNtn,
    required this.representativeName,
    required this.representativePosition,
    required this.representativeCnic,
    required this.companyPecLicense,
    required this.rFcnic,
    required this.rBcnic,
    required this.status,
    required this.tokens,
    required this.totalProjects,
  });

  factory Contractor.fromJson(Map<String, dynamic> json) => Contractor(
    contractorId: json['contractor_id'] as int,
    noOfEmployees: json['no_of_employees'] as int,
    userId: json['user_id'] as int,
    contractorType: json['contractor_type'] as String,
    description: json['description'] as String,
    contractorRating: json['contractor_rating'] as String,
    companyId: json['company_id']??0 as int,
    companyName: json['company_name'] as String,
    companyEmail: json['company_email'] as String,
    companyNtn: json['company_ntn'] as int,
    representativeName: json['representative_name'] as String,
    representativePosition: json['representative_position'] as String,
    representativeCnic: json['representative_cnic']??'cnic',
    companyPecLicense: json['company_pec_license'] as String,
    rFcnic: json['r_fcnic'] as String,
    rBcnic: json['r_bcnic'] as String,
    status: json['status'] as String,
    tokens: json['tokens']??'',
    totalProjects: json['total_projects'] as int,
  );

  Map<String, dynamic> toJson() => {
    'contractor_id': contractorId,
    'no_of_employees': noOfEmployees,
    'user_id': userId,
    'contractor_type': contractorType,
    'description': description,
    'contractor_rating': contractorRating,
    'company_id': companyId,
    'company_name': companyName,
    'company_email': companyEmail,
    'company_ntn': companyNtn,
    'representative_name': representativeName,
    'representative_position': representativePosition,
    'representative_cnic': representativeCnic,
    'company_pec_license': companyPecLicense,
    'r_fcnic': rFcnic,
    'r_bcnic': rBcnic,
    'status': status,
    'tokens': tokens,
    'total_projects': totalProjects,
  };
}

class IndividualContractor {
  int contractorId; // Renamed from contractor_id
  int noOfEmployees; // Renamed from no_of_employees
  int userId; // Renamed from user_id
  String contractorType; // No change
  String description; // No change
  String contractorRating; // Renamed from contractor_rating
  int individualId; // Renamed from individual_id
  String individualName; // Renamed from individual_name
  String individualEmail; // Renamed from individual_email
  String status; // No change
  dynamic tokens; // No change (can be null)
  int totalProjects; // Renamed from total_projects

  IndividualContractor({
    required this.contractorId,
    required this.noOfEmployees,
    required this.userId,
    required this.contractorType,
    required this.description,
    required this.contractorRating,
    required this.individualId,
    required this.individualName,
    required this.individualEmail,
    required this.status,
    this.tokens,
    required this.totalProjects,
  });

  factory IndividualContractor.fromJson(Map<String, dynamic> json) =>
      IndividualContractor(
        contractorId: json['contractor_id'] as int,
        noOfEmployees: json['no_of_employees'] as int,
        userId: json['user_id'] as int,
        contractorType: json['contractor_type'] as String,
        description: json['description'] as String,
        contractorRating: json['contractor_rating'] as String,
        individualId: json['individual_id'] as int,
        individualName: json['individual_name'] as String,
        individualEmail: json['individual_email'] as String,
        status: json['status'] as String,
        tokens: json['tokens'],
        totalProjects: json['total_projects'] as int,
      );

  Map<String, dynamic> toJson() => {
    'contractor_id': contractorId,
    'no_of_employees': noOfEmployees,
    'user_id': userId,
    'contractor_type': contractorType,
    'description': description,
    'contractor_rating': contractorRating,
    'individual_id': individualId,
    'individual_name': individualName,
    'individual_email': individualEmail,
    'status': status,
    'tokens': tokens,
    'total_projects': totalProjects,
  };
}



class ContractorReg {
  final int? contractorId; // Nullable contractor_id
  final String? noOfEmployees; // Nullable no_of_employees
  final int? userId; // Nullable user_id
  final String? contractorType; // Nullable contractor_type
  final String? description; // Nullable description
  final String? contractorRating; // Nullable contractor_rating
  final int? individualId; // Nullable individual_id
  final String? individualName; // Nullable individual_name
  final String? individualEmail; // Nullable individual_email
  final String? status; // Nullable status
  final dynamic? tokens; // Nullable tokens
  final String? cnic;
  final String? cnicfpath;
  final String? cnicbpath;
  final int? totalProjects; // Nullable total_projects
  final String? contractorImage; // Nullable contractor_image
  final String? position;
  final String? companyName;
  final String? ntn;

  ContractorReg({
    this.companyName,
    this.contractorId,
    this.cnicfpath,
    this.cnicbpath,
    this.position,
    this.cnic,
    this.noOfEmployees,
    this.userId,
    this.contractorType,
    this.description,
    this.contractorRating,
    this.individualId,
    this.individualName,
    this.individualEmail,
    this.ntn,
    this.status,
    this.tokens,
    this.totalProjects,
    this.contractorImage,
  });

  factory ContractorReg.fromJson(Map<String, dynamic> json) =>
      ContractorReg(
        contractorId: json['contractor_id'] as int?,
        noOfEmployees: json['no_of_employees'] as String?,
        userId: json['user_id'] as int?,
        contractorType: json['contractor_type'] as String?,
        description: json['description'] as String?,
        contractorRating: json['contractor_rating'] as String?,
        individualId: json['individual_id'] as int?,
        individualName: json['individual_name'] as String?,
        individualEmail: json['individual_email'] as String?,
        status: json['status'] as String?,
        tokens: json['tokens'],
        totalProjects: json['total_projects'] as int?,
        contractorImage: json['contractor_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'contractor_id': contractorId,
    'no_of_employees': noOfEmployees,
    'user_id': userId,
    'contractor_type': contractorType,
    'description': description,
    'contractor_rating': contractorRating,
    'individual_id': individualId,
    'individual_name': individualName,
    'individual_email': individualEmail,
    'status': status,
    'tokens': tokens,
    'total_projects': totalProjects,
    'contractor_image': contractorImage,
  };
}


