


import 'message_model.dart';

class Chat {
  String? id;
  List<String>? participants;
  List<Message>? messages;

  Chat({this.id, this.participants, this.messages});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participants = List<String>.from(json['participants']);
    messages =
        List.from(json['messages']).map((m) => Message.fromJson(m)).toList();
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'messages': messages?.map((message) => message.toJson()).toList(),
    };
  }
}

class ChatModel {
  int chatId;
  int userId;
  int contractorId;
  int? noOfEmployees;
  String? contractorType;
  String? description;
  double? contractorRating;
  int? companyId;
  String? companyName;
  String? companyEmail;
  String? companyNtn;
  String? representativeName;
  String? representativePosition;
  String? representativeCnic;
  String? companyPecLicense;
  String? rFcnic;
  String? rBcnic;
  String? status;
  dynamic tokens;
  int? totalProjects;
  String? contractorImage;
  int? individualId;
  String? individualName;
  String? individualEmail;

  ChatModel({
    required this.chatId,
    required this.userId,
    required this.contractorId,
    this.noOfEmployees,
    this.contractorType,
    this.description,
    this.contractorRating,
    this.companyId,
    this.companyName,
    this.companyEmail,
    this.companyNtn,
    this.representativeName,
    this.representativePosition,
    this.representativeCnic,
    this.companyPecLicense,
    this.rFcnic,
    this.rBcnic,
    this.status,
    this.tokens,
    this.totalProjects,
    this.contractorImage,
    this.individualId,
    this.individualName,
    this.individualEmail,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    chatId: json['chat_id'],
    userId: json['user_id'],
    contractorId: json['contractor_id'],
    noOfEmployees: json['no_of_employees'],
    contractorType: json['contractor_type'],
    description: json['description'],
    contractorRating: json['contractor_rating'],
    companyId: json['company_id'],
    companyName: json['company_name'],
    companyEmail: json['company_email'],
    companyNtn: json['company_ntn'],
    representativeName: json['representative_name'],
    representativePosition: json['representative_position'],
    representativeCnic: json['representative_cnic'],
    companyPecLicense: json['company_pec_license'],
    rFcnic: json['r_fcnic'],
    rBcnic: json['r_bcnic'],
    status: json['status'],
    tokens: json['tokens'],
    totalProjects: json['total_projects'],
    contractorImage: json['contractor_image'],
    individualId: json['individual_id'],
    individualName: json['individual_name'],
    individualEmail: json['individual_email'],
  );

  Map<String, dynamic> toJson() => {
    'chat_id': chatId,
    'user_id': userId,
    'contractor_id': contractorId,
    'no_of_employees': noOfEmployees,
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
    'contractor_image': contractorImage,
    'individual_id': individualId,
    'individual_name': individualName,
    'individual_email': individualEmail,
  };
}

