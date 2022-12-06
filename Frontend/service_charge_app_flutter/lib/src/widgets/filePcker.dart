import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:universal_html/html.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class FilePcker extends StatefulWidget {
   const FilePcker({super.key});
 
  @override
  State<FilePcker> createState() => _FilePckerState();
}

class _FilePckerState extends State<FilePcker> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile()async{
    try{
      setState(() {
        isLoading = true;
      });

  result = await FilePicker.platform.pickFiles(
    type: FileType.any,
    allowMultiple: false,
  );

  if(result != null){
    _fileName = result!.files.first.name;
    pickedfile = result!.files.first;
    fileToDisplay = File(pickedfile!.bytes.toString());

    print('File name $_fileName');
  }


      setState(() {
        isLoading = false;
      });
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(width: 3),
            Center(child: isLoading
            ? CircularProgressIndicator()
            : TextButton(onPressed: (){
              pickFile();
            }, child: const Text('Attach File',
                              style: 
                                  TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    color: Colors.black,
                                    ),
                                  )),
            ),
            if(pickedfile != null)
        Text('$_fileName', style: 
                                 const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    ),),
          ],
        ),
        
        // SizedBox(
        //   height: 300, width: 400, child: Image.network(fileToDisplay!.path)
        // )
      ],
    );
  }
}