import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognitionController extends ChangeNotifier{

  var textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  late ImagePicker imagePicker;
  String? Cnicf;
  File? CnicfileF;
  String? Cnicb;
  File? CnicfileB;
  String recognizedText = "";
  bool isRecognizing = false;
  String? cnicNumber = '';


  void pickImageAndProcess({required ImageSource source,required bool front}) async {
    imagePicker = ImagePicker();


    print('sourcec is $source');
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage == null) {
      return;
    }
    if(front)
      {
        Cnicf = pickedImage.path;
        CnicfileF = File(pickedImage.path);
      }
    else{
      Cnicb = pickedImage.path;
      CnicfileB = File(pickedImage.path);

      notifyListeners();
      return;

    }

      isRecognizing = true;

    print('in recognizing');


    try {
      final InputImage inputImage;
      inputImage = InputImage.fromFilePath(pickedImage.path);
      final RecognizedText recognisedText =
      await textRecognizer.processImage(inputImage);

      recognizedText = recognisedText.text;




      RegExp cnicPattern = RegExp(r'\b\d{5}-\d{7}-\d{1}\b');

      // Search for CNIC pattern in extracted text
      Iterable<Match> matches = cnicPattern.allMatches(recognisedText.text);

      // Extracted CNIC number


      // Iterate through matches to find the CNIC number
      for (Match match in matches) {
        cnicNumber = match.group(0);
       print('CNIC $cnicNumber');
        break; // Stop after the first match (assuming CNIC appears only once)
      }

      for (TextBlock block in recognisedText.blocks) {
        for (TextLine line in block.lines) {
          recognizedText += "${line.text}\n";
        }
      }
    } catch (e) {
      print('error $e');

        print('error $e');
        return;



    } finally {

        isRecognizing = false;

    }

    notifyListeners();
  }


}