class DataModel {
  int totalEarnings;
  List<EarningsByMonth> earningsByMonth;
  List<OngoingProject> ongoingProjects;
  int contractorTokens;

  DataModel({
    required this.totalEarnings,
    required this.earningsByMonth,
    required this.ongoingProjects,
    required this.contractorTokens,
  });

  // Factory constructor for creating a new DataModel instance from a map
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      totalEarnings: json['total_earnings'],
      earningsByMonth: List<EarningsByMonth>.from(json['earnings_by_month'].map((x) => EarningsByMonth.fromJson(x))),
      ongoingProjects: List<OngoingProject>.from(json['ongoing_projects'].map((x) => OngoingProject.fromJson(x))),
      contractorTokens: json['contractor_tokens'],
    );
  }

  // Method to convert DataModel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'total_earnings': totalEarnings,
      'earnings_by_month': List<dynamic>.from(earningsByMonth.map((x) => x.toJson())),
      'ongoing_projects': List<dynamic>.from(ongoingProjects.map((x) => x.toJson())),
      'contractor_tokens': contractorTokens,
    };
  }
}

class EarningsByMonth {
  String month;
  int earnings;

  EarningsByMonth({
    required this.month,
    required this.earnings,
  });

  // Factory constructor for creating a new EarningsByMonth instance from a map
  factory EarningsByMonth.fromJson(Map<String, dynamic> json) {
    return EarningsByMonth(
      month: json['month'],
      earnings: json['earnings'],
    );
  }

  // Method to convert EarningsByMonth instance to a map
  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'earnings': earnings,
    };
  }
}

class OngoingProject {
  String count;

  OngoingProject({
    required this.count,
  });

  // Factory constructor for creating a new OngoingProject instance from a map
  factory OngoingProject.fromJson(Map<String, dynamic> json) {
    return OngoingProject(
      count: json['count'],
    );
  }

  // Method to convert OngoingProject instance to a map
  Map<String, dynamic> toJson() {
    return {
      'count': count,
    };
  }
}
