import 'dart:developer';
import 'dart:io' as dart_io;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';


class AppController extends GetxController {
  RxString fileName = "".obs;
  RxString prediction = "".obs;
  RxBool isLoading = true.obs;
  RxString confidenceScore = "".obs;
  List<dynamic> imageFiles = [];
  RxBool isSelectedHome = true.obs;

  List<int>? videoBytes;
  String? mimeType;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null) {
      fileName.value = result.files.single.name;
      videoBytes = result.files.single.bytes!;
      // appController.videoPath.value = result.files.single.path!;
      mimeType = result.files.single.extension;
    }
  }

  Future<bool> analyzeVideo(List<int> videoBytes, String? mimeType) async {
    isLoading.value = true;
    prediction.value = "";
    confidenceScore.value = "";

    final dioClient = dio.Dio();
    // final dioClient = dio.Dio(dio.BaseOptions(
    //   connectTimeout: const Duration(minutes: 5),
    //   receiveTimeout: const Duration(minutes: 10),
    //   sendTimeout: const Duration(minutes: 5),
    // ));
    // const url = 'http://192.168.52.15:3000/predict';
    const url = 'http://localhost:3000/predict';

    try {
      log("Analyzing video: ${fileName.value}");
      log("Mime type: $mimeType");

      dio.FormData formData = dio.FormData.fromMap({
        'video': dio.MultipartFile.fromBytes(
          videoBytes,
          filename: fileName.value,
          contentType: MediaType.parse('video/${mimeType}'),
        ),
      });

      log("Sending request to $url");
      dio.Response response = await dioClient.post(
        url,
        data: formData,
        options: dio.Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        log('Analysis successful');
        log(response.data["class_name"]);

        log(response.data["probabilities"][prediction.value.toLowerCase()]
            .toString());
        prediction.value = response.data["class_name"];
        final double confidence = (response.data["probabilities"]
                [prediction.value.toLowerCase()]) *
            100;
        confidenceScore.value = confidence.toStringAsFixed(2);
        log("Confidence : ${confidenceScore.value}");
        imageFiles = response.data["frames"];

        // final tempDir = await getTemporaryDirectory();
        // for (int i = 0; i < response.data["frames"].length; i++) {
        //   final String base64Image = response.data["frames"][i];
        //   Uint8List bytes = base64Decode(base64Image);

        //   final file = dart_io.File('${tempDir.path}/frame_$i.jpg');
        //   await file.writeAsBytes(bytes);
        //   imageFiles.add(file);
        // }
        isLoading.value = false;

        return true;
      } else {
        log('Server error: ${response.statusCode} - ${response.statusMessage}');
        return false;
      }
    } on dio.DioException catch (e) {
      log('Dio error: ${e.response?.statusCode} - ${e.message}');
      isLoading.value = false;
      return false;
    } on dart_io.SocketException {
      log('No internet connection');
      isLoading.value = false;
      return false;
    } on FormatException {
      log('Bad response format');
      isLoading.value = false;
      return false;
    } catch (e) {
      log('Unexpected error: $e');
      isLoading.value = false;
      return false;
    }
  }
}













// import 'dart:developer';
// import 'dart:io' as dart_io;
// import 'dart:typed_data';

// import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart';

// class AppController extends GetxController {
//   RxString fileName = "".obs;
  
//   Future<void> analyzeVideo(List<int> videoBytes, String mimeType) async {
//     final dioClient = dio.Dio();
//     const url = 'http://localhost:3000/predict';

//     try {
//       // dart_io.File videoFile = dart_io.File(filePath);

//       // if (!await videoFile.exists()) {
//       // throw Exception('File not found at path: $filePath');
//       // }

//       // String fileName = videoFile.path.split('/').last;
//       log("Analyzing video");

//       // dio.FormData formData = dio.FormData.fromMap({
//       //   'video': await dio.MultipartFile.fromBytes(videoBytes,
//       //       filename: fileName.value),
//       // });

//     if (mimeType == null || !mimeType.startsWith('video/')) {
//       print('Error: Only video files are allowed');
//       return;
//     }

//     print('File selected: $fileName');

//     dio.FormData formData = dio.FormData.fromMap({
//       'video':await dio.MultipartFile.fromBytes(
//         videoBytes,
//         filename: fileName.value,
//        contentType: dio.Headers.parseContentType(mimeType)
//       ),
//     });

//       dio.Response response = await dioClient.post(url, data: formData);

//       if (response.statusCode == 200) {
//         print('Upload successful: ${response.data}');
//       } else {
//         print(
//             'Server error: ${response.statusCode} - ${response.statusMessage}');
//       }
//     } on dio.DioException catch (e) {
//       print('Dio error: ${e.response?.statusCode} - ${e.message}');
//     } on dart_io.SocketException {
//       print('No internet connection');
//     } on FormatException {
//       print('Bad response format');
//     } catch (e) {
//       print('Unexpected error: $e');
//     }
//   }
// }




