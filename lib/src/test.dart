// part of http_handler;
//
//
//
// class HttpHandler {
//   static String endPointUrl = APIEndPoints.endPoint;
//
//   static Future<Map<String, String>> getHeaders() async {
//     String? token = await getDataFromLocalStorage(dataType: StorageKey.stringType, prefKey: StorageKey.token);
//
//     if (token == null) {
//       kDebugPrint("Token -- '$token'");
//       return {'Content-type': 'application/json', 'Accept': 'application/json',"Connection" : "keep-alive", "Accept-Encoding": "gzip, deflate, br"/* 'Authorization': 'Bearer $token',*//* 'x-org-id': ''*/};
//     } else {
//       return {'Content-type': 'application/json', 'Accept': 'application/json',"Connection" : "keep-alive", "Accept-Encoding": "gzip, deflate, br"/* 'x-org-id': ''*/};
//     }
//   }
//
//   static Future<Map<String, dynamic>> getHttpMethod({header, required String? url}) async {
//     var header = await getHeaders();
//     kDebugPrint("Get URL -- '$endPointUrl$url'");
//     kDebugPrint("Get Data -- 'null'");
//     kDebugPrint("Get Header -- '$header'");
//     http.Response response = await http.get(
//       Uri.parse("$endPointUrl$url"),
//       headers: header,
//     );
//     kDebugPrint("Get Response Code -- '${response.statusCode}'");
//     kDebugPrint("Get Response -- '${response.body}'");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       kDebugPrint("In Get '${response.statusCode}'");
//       Map<String, dynamic> data = {
//         'body': response.body,
//         'headers': response.headers,
//         'error': null,
//       };
//       return data;
//     } else {
//       kDebugPrint("In Get 'else - ${response.statusCode}'");
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
//
//   static Future<Map<String, dynamic>> postHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
//     var header = await getHeaders();
//     kDebugPrint("Post URL -- '$endPointUrl$url'");
//     kDebugPrint("Post Data -- '$data'");
//     kDebugPrint("Post Header -- '$header'");
//     http.Response response = await http.post(
//       Uri.parse("$endPointUrl$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     kDebugPrint("Post Response Code -- '${response.statusCode}'");
//     kDebugPrint("Post Response -- '${response.body}'");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': null,
//       };
//     } else {
//       kDebugPrint("In Post 'else - ${response.statusCode}'");
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
//
//   static Future<Map<String, dynamic>> patchHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
//     var header = await getHeaders();
//     kDebugPrint("Patch URL -- '$endPointUrl$url'");
//     kDebugPrint("Patch Data -- '$data'");
//     kDebugPrint("Patch Header -- '$header'");
//     http.Response response = await http.patch(
//       Uri.parse("$endPointUrl$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     kDebugPrint("Patch Response Code -- '${response.statusCode}'");
//     kDebugPrint("Patch Response -- '${response.body}'");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       kDebugPrint("In Patch '${response.statusCode}'");
//       Map<String, dynamic> data = {
//         'body': response.body,
//         'headers': response.headers,
//         'error': null,
//       };
//       return data;
//     } else {
//       kDebugPrint("In Patch 'else - ${response.statusCode}'");
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
//
//   static Future<Map<String, dynamic>> putHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
//     var header = await getHeaders();
//     kDebugPrint("Put URL -- '$endPointUrl$url'");
//     kDebugPrint("Put Data -- '$data'");
//     kDebugPrint("Put Header -- '$header'");
//     http.Response response = await http.put(
//       Uri.parse("$endPointUrl$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     kDebugPrint("PUT Response code -- '${response.statusCode}'");
//     kDebugPrint("PUT Response -- '${response.body}'");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       kDebugPrint("In Put '${response.statusCode}'");
//       Map<String, dynamic> data = {
//         'body': response.body,
//         'headers': response.headers,
//         'error': null,
//       };
//       return data;
//     } else {
//       kDebugPrint("In Put 'else - ${response.statusCode}'");
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
//
//   static Future<Map<String, dynamic>> deleteHttpMethod({@required String? url}) async {
//     var header = await getHeaders();
//     kDebugPrint("Delete URL -- '$endPointUrl$url'");
//     kDebugPrint("Delete Data -- 'null'");
//     kDebugPrint("Delete Header -- '$header'");
//     http.Response response = await http.delete(
//       Uri.parse("$endPointUrl$url"),
//       headers: header,
//     );
//     kDebugPrint("Delete Response Code -- '${response.statusCode}'");
//     kDebugPrint("Delete Response -- '${response.body}'");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       kDebugPrint("In Delete '${response.statusCode}'");
//       Map<String, dynamic> data = {
//         'body': response.body,
//         'headers': response.headers,
//         'error': null,
//       };
//       return data;
//     } else {
//       kDebugPrint("In Delete 'else - ${response.statusCode}'");
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
// //Method Type = POST, GET
//   static Future<Map<String, dynamic>> formHttpMethod(
//       {@required String? methodType,
//         @required String? url,
//         Map<String, String>? data,
//         File? singleFile,
//         // File? singleFile2,
//         String? singleFileKey,
//         // String? singleFileKey2,
//         List<File>? multipleFile,
//         List<String>? multipleFileKeysList,
//         String? multipleFileKey
//       }) async {
//     var header = await getHeaders();
//     kDebugPrint("Form URL -- '$endPointUrl$url'");
//     kDebugPrint("Form Header -- '$header'");
//     http.MultipartRequest request = http.MultipartRequest(methodType!, Uri.parse("$endPointUrl$url"));
//     request.headers.addAll(header);
//     if (data != null) {
//       request.fields.addAll(data);
//     }
//     if (singleFile != null) {
//       request.files.add(await http.MultipartFile.fromPath(
//         singleFileKey!,
//         singleFile.path,
//       ));
//     }
// /*    if (singleFile2 != null) {
//       request.files.add(await http.MultipartFile.fromPath(
//         singleFileKey2!,
//         singleFile2.path,
//       ));
//     }*/
//
//     if(multipleFileKey!=null){
//       if(multipleFileKeysList!=null){
//         if(multipleFileKeysList.isNotEmpty){
//           for (var i =0; i <multipleFile!.length; i++) {
//             request.files.add(await http.MultipartFile.fromPath(multipleFileKeysList[i], multipleFile[i].path));
//           }
//         }
//       }else{
//         if (multipleFile!.isNotEmpty) {
//           for (File element in multipleFile) {
//             request.files.add(await http.MultipartFile.fromPath(
//               multipleFileKey!,
//               element.path,
//             ));
//           }
//         }
//       }
//     }
//
//     kDebugPrint("FORM FIELDS - ${request.fields}");
//     kDebugPrint("FORM FILES - ${request.files}");
//     http.StreamedResponse streamedResponse = await request.send();
//     if (streamedResponse.statusCode == 200 || streamedResponse.statusCode == 201) {
//       http.Response response = await http.Response.fromStream(streamedResponse);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         kDebugPrint("In Post '${response.statusCode}'");
//         kDebugPrint("FORM RESPONSE -- '${response.body}'");
//         // int status = json.decode(response.body)["status"];
//         if (kDebugMode) {
//           kDebugPrint("STATUS _+_+_+_+_+_+_ ${response.statusCode}");
//         }
//         Map<String, dynamic> data;
//         if (response.statusCode == 1) {
//           data = {
//             'body': response.body,
//             'headers': response.headers,
//             'error': null,
//           };
//         } else {
//           data = {
//             'body': response.body,
//             'headers': response.headers,
//             'error': response.statusCode,
//           };
//         }
//         return data;
//       } else {
//         kDebugPrint("In Form 'else - ${response.statusCode}'");
//         return {
//           'body': response.body,
//           'headers': response.headers,
//           'error': "${response.statusCode}",
//         };
//       }
//     } else {
//       kDebugPrint("In Form 'else ---- ${streamedResponse.statusCode}'");
//       return {
//         'headers': streamedResponse.headers,
//         'error': "${streamedResponse.statusCode}",
//       };
//     }
//   }
//
// // Future postMultiplePdf({
// //   Map<String, String>? projectId,
// //   List<File>? selectedFiles,
// //   String? fileType,
// // }) async {
// //   var response = await HttpHandler.formHttpMethod(url: APIEndPoints.Pdfs,
// //       data: projectId,
// //       methodType: 'POST',
// //       multipleFile: selectedFiles,
// //       multipleFileKey: "file");
// //
// //   if (response["error"] == null) {
// //     var responseData = jsonDecode(response["body"]);
// //
// //     if (responseData["data"] != null) {
// //
// //     }
// //     debugPrint("----------> Success----------");
// //   } else if (response['error'] != null) {
// //     Toast.errorToast(message: "Oops Something went wrong");
// //     debugPrint("----------> Something went wrong");
// //   } else {
// //     debugPrint("----------> ELSE");
// //     Toast.errorToast(message: "Oops Something went wrong");
// //   }
// // }
//
//
//
// /*  upload(File imageFile) async {
//     // open a bytestream
//     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     // get file length
//     var length = await imageFile.length();
//
//     // string to uri
//     var uri = Uri.parse("http://ip:8082/composer/predict");
//
//     // create multipart request
//     var request = new http.MultipartRequest("POST", uri);
//
//     // multipart that takes file
//     var multipartFile = http.MultipartFile('file', stream, length,
//         filename: imageFile.path
//         // filename: basename(imageFile.path)
//
//     );
//
//     // add file to multipart
//     request.files.add(multipartFile);
//
//     // send
//     var response = await request.send();
//     kDebugPrint(response.statusCode);
//
//     // listen for response
//     response.stream.transform(utf8.decoder).listen((value) {
//       kDebugPrint(value);
//     });
//   }*/
//
// }
