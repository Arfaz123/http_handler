part of http_handler;
//
// class HttpHandler {
//   final BuildContext Function() getBuildContext;
//
//   HttpHandler({required this.getBuildContext});
//
//   Future<Map<String, String>> getHeaders() async {
//     // Your existing getHeaders logic
//   }
//
//   Future<Map<String, dynamic>> callAPI({
//     required String method,
//     required String url,
//     Map<String, dynamic>? data,
//     File? singleFile,
//     String? singleFileKey,
//     List<File>? multipleFile,
//     List<String>? multipleFileKeysList,
//     String? multipleFileKey,
//     bool showProcess = false,
//   }) async {
//     var header = await getHeaders();
//
//     if (showProcess) {
//       showLoadingDialog();
//     }
//
//     try {
//       http.Response response;
//
//       if (method == 'GET') {
//         response = await http.get(
//           Uri.parse(url),
//           headers: header,
//         );
//       } else if (method == 'POST') {
//         response = await http.post(
//           Uri.parse(url),
//           headers: header,
//           body: data == null ? null : jsonEncode(data),
//         );
//       } else if (method == 'PATCH') {
//         response = await http.patch(
//           Uri.parse(url),
//           headers: header,
//           body: data == null ? null : jsonEncode(data),
//         );
//       } else if (method == 'PUT') {
//         response = await http.put(
//           Uri.parse(url),
//           headers: header,
//           body: data == null ? null : jsonEncode(data),
//         );
//       } else if (method == 'DELETE') {
//         response = await http.delete(
//           Uri.parse(url),
//           headers: header,
//         );
//       } else if (method == 'FORM') {
//         response = await formHttpMethod(
//           url: url,
//           data: data,
//           singleFile: singleFile,
//           singleFileKey: singleFileKey,
//           multipleFile: multipleFile,
//           multipleFileKeysList: multipleFileKeysList,
//           multipleFileKey: multipleFileKey,
//         );
//       } else {
//         throw ArgumentError('Invalid method: $method');
//       }
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> responseData = {
//           'body': response.body,
//           'headers': response.headers,
//           'error': null,
//         };
//         return responseData;
//       } else {
//         return {
//           'body': response.body,
//           'headers': response.headers,
//           'error': "${response.statusCode}",
//         };
//       }
//     } catch (e) {
//       return {
//         'error': 'An error occurred: $e',
//       };
//     } finally {
//       if (showProcess) {
//         hideLoadingDialog();
//       }
//     }
//   }
//
//   Future<Map<String, dynamic>> formHttpMethod({
//     required String url,
//     Map<String, String>? data,
//     File? singleFile,
//     String? singleFileKey,
//     List<File>? multipleFile,
//     List<String>? multipleFileKeysList,
//     String? multipleFileKey,
//   }) async {
//     var header = await getHeaders();
//
//     http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers.addAll(header);
//
//     if (data != null) {
//       request.fields.addAll(data);
//     }
//
//     if (singleFile != null) {
//       request.files.add(await http.MultipartFile.fromPath(
//         singleFileKey!,
//         singleFile.path,
//       ));
//     }
//
//     if (multipleFileKey != null) {
//       if (multipleFileKeysList != null) {
//         if (multipleFileKeysList.isNotEmpty) {
//           for (var i = 0; i < multipleFile!.length; i++) {
//             request.files.add(await http.MultipartFile.fromPath(
//               multipleFileKeysList[i],
//               multipleFile[i].path,
//             ));
//           }
//         }
//       } else {
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
//     try {
//       http.StreamedResponse streamedResponse = await request.send();
//       http.Response response = await http.Response.fromStream(streamedResponse);
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> responseData = {
//           'body': response.body,
//           'headers': response.headers,
//           'error': null,
//         };
//         return responseData;
//       } else {
//         return {
//           'body': response.body,
//           'headers': response.headers,
//           'error': "${response.statusCode}",
//         };
//       }
//     } catch (e) {
//       return {
//         'error': 'An error occurred: $e',
//       };
//     }
//   }
//
// }
