import 'package:flutter/cupertino.dart';

class CostEstimationModel extends ChangeNotifier{

  double totalCost=0;
  double greyStructure=0;
  double finishingcost=0;
  double loborcost=0;


  // Grey Structure costs
// Grey Structure costs
  final double greyStructureTotal = 901000;
  final double brickCementSand = 29366;
  final double roof = 50000;
  final double excavationSteel = 700000;
  final double laborCostGreyStructure = 120000;

  // Plumbing costs
  final double plumbingTotal = 100000;
  final double plumbingMaterial = 90000;
  final double laborCostPlumbing = 10000;

  // Electrical costs
  final double electricalTotal = 180000;
  final double electricalMaterial = 155000;
  final double laborCostElectrical = 14000;

  // Other costs
  final double woodMetalTile = 500000;
  final double fittingFixtures = 120000;

  // Constructor
  CostEstimationModel();
   double IgreyStructureTotal = 0;

   double IbrickCementSand = 0;
   double Iroof = 0;
   double IexcavationSteel = 0;
   double IlaborCostGreyStructure = 0;

  // Plumbing costs
   double IplumbingTotal = 0;
   double IplumbingMaterial = 0;
   double IlaborCostPlumbing = 0;

  // Electrical costs
   double IelectricalTotal = 0;
   double IelectricalMaterial = 0;
   double IlaborCostElectrical = 0;

  // Other costs
   double IwoodMetalTile = 0;
   double IfittingFixtures = 0;

  double MgreyStructureTotal = 0;

  double MbrickCementSand = 0;
  double Mroof = 0;
  double MexcavationSteel = 0;
  double MlaborCostGreyStructure = 0;

  // Plumbing costs
  double MplumbingTotal = 0;
  double MplumbingMaterial = 0;
  double MlaborCostPlumbing = 0;

  // Electrical costs
  double MelectricalTotal = 0;
  double MelectricalMaterial = 0;
  double MlaborCostElectrical = 0;

  // Other costs
  double MwoodMetalTile = 0;
  double MfittingFixtures = 0;


  calculateIndividualCost(int floor,int marla,int room,int washroom,int kitchen,int living_room)
  {
    // IgreyStructureTotal= greyStructureTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IbrickCementSand= brickCementSand+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    Iroof= roof+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IexcavationSteel= excavationSteel+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IlaborCostGreyStructure= laborCostGreyStructure+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    // IplumbingTotal= plumbingTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IplumbingMaterial= plumbingMaterial+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IlaborCostPlumbing= laborCostPlumbing+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    // IelectricalTotal=electricalTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IelectricalMaterial= electricalMaterial+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IlaborCostElectrical= laborCostElectrical+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IwoodMetalTile= woodMetalTile+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IfittingFixtures= fittingFixtures+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);


    // IgreyStructureTotal= greyStructureTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IbrickCementSand= IbrickCementSand*0.8;
    Iroof= Iroof*0.8;
    IexcavationSteel= IexcavationSteel*0.8;
    IlaborCostGreyStructure= IlaborCostGreyStructure*0.8;
    // IplumbingTotal= plumbingTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IplumbingMaterial= IplumbingMaterial*0.8;
    IlaborCostPlumbing= IlaborCostPlumbing*0.8;
    // IelectricalTotal=electricalTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    IelectricalMaterial= IelectricalMaterial*0.8;
    IlaborCostElectrical= IlaborCostElectrical*0.8;
    IwoodMetalTile= IwoodMetalTile*0.8;
    IfittingFixtures= IfittingFixtures*0.8;

    // IgreyStructureTotal= greyStructureTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    MbrickCementSand= IbrickCementSand*marla;
    Mroof= Iroof*marla;
    MexcavationSteel= IexcavationSteel*marla;
    MlaborCostGreyStructure= IlaborCostGreyStructure*marla;
    // IplumbingTotal= plumbingTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    MplumbingMaterial= IplumbingMaterial*marla;
    MlaborCostPlumbing= IlaborCostPlumbing*marla;
    // IelectricalTotal=electricalTotal+(room*4500)+(washroom*1500)+(kitchen*2307)+(living_room*4615);
    MelectricalMaterial= IelectricalMaterial*marla;
    MlaborCostElectrical= IlaborCostElectrical*marla;
    MwoodMetalTile= IwoodMetalTile*marla;
    MfittingFixtures= IfittingFixtures*marla;

     totalCost =
        IgreyStructureTotal + IbrickCementSand +
            Iroof + IexcavationSteel +
            IlaborCostGreyStructure + IplumbingTotal +
            IplumbingMaterial + IlaborCostPlumbing +
            IelectricalTotal + IelectricalMaterial +
            IlaborCostElectrical + IwoodMetalTile +IfittingFixtures;

     totalCost=totalCost*marla;

     greyStructure=  IgreyStructureTotal + IbrickCementSand +
         Iroof + IexcavationSteel +
         IlaborCostGreyStructure;

     finishingcost=totalCost-greyStructure;

     loborcost=IlaborCostGreyStructure+IlaborCostPlumbing+IlaborCostElectrical;



     // totalCost=totalCost*0.8;

    if(floor==1)
    {
      print('cost before $totalCost');
      totalCost=totalCost*0.67;
    }
    else
    {

    }

    print(totalCost);

    notifyListeners();

  }


  // Method to calculate total cost for given Marlas
  double calculateTotalCost(int floor,int marla,int room,int washroom,int kitchen,int living_room) {
    double totalCost = greyStructureTotal +
        plumbingTotal +
        electricalTotal +
        woodMetalTile +
        fittingFixtures;
    totalCost= totalCost * marla;
    totalCost= totalCost+(room*60000)+(washroom*20000)+(kitchen*30000)+(living_room*60000);

    if(floor==1)
      {
        print(totalCost);
        totalCost=totalCost*0.57;
      }
    else
      {

      }

    print(totalCost);
    return totalCost;
  }

}


