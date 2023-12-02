part of http_handler;

/// HTTP Handler Class
///
/// A Flutter package for simplifying network API calls using the Dio HTTP client.
/// It provides utility functions and customization options to streamline API
/// request handling in your Flutter applications.
///
/// [customErrorDialog]: Custom widget for error dialogs.
/// [customLoadingDialog]: Custom widget for loading dialogs.
/// [isCheckNetworkConnectivity]: Flag to check network connectivity before making requests.
/// [isAlertDialogs]: Flag to show alert dialogs for errors.
/// [isCallBackTime]: Flag to measure API callback time in debug mode.
/// [getBuildContext]: Callback to get BuildContext.
class HttpHandler {
  final dynamic customErrorDialog;
  final dynamic customLoadingDialog;
  final bool isCheckNetworkConnectivity;
  final bool isAlertDialogs;
  final bool isCallBackTime;
  final BuildContext getBuildContext; // Callback to get BuildContext

  /// Constructor for the HttpHandler class.
  ///
  /// [customErrorDialog]: Custom widget for error dialogs.
  /// [customLoadingDialog]: Custom widget for loading dialogs.
  /// [isCheckNetworkConnectivity]: Flag to check network connectivity before making requests.
  /// [isAlertDialogs]: Flag to show alert dialogs for errors.
  /// [isCallBackTime]: Flag to measure API callback time in debug mode.
  /// [getBuildContext]: Callback to get BuildContext.
  HttpHandler({
    this.customErrorDialog,
    this.customLoadingDialog,
    required this.getBuildContext, // Pass a callback to get BuildContext
    this.isCheckNetworkConnectivity = false,
    this.isAlertDialogs = true,
    this.isCallBackTime = false,
  });

  /// Method to make API calls.
  ///
  /// [headers]: Future that resolves to a map of headers for the request.
  /// [body]: Map containing the request body.
  /// [serviceUrl]: URL for the API request.
  /// [method]: HTTP method for the request (GET, POST, PATCH, PUT, DELETE, FORM).
  /// [formData]: Map containing form data for FORM requests.
  /// [success]: Callback function for a successful response.
  /// [error]: Callback function for an error response.
  /// [showProcess]: Flag to display a loading dialog.
  /// [singleFile]: Single file for file upload.
  /// [singleFileKey]: Key for the single file in the request.
  /// [multipleFile]: List of files for multiple file upload.
  /// [multipleFileKeysList]: List of keys for multiple files in the request.
  /// [multipleFileKey]: Key for multiple files in the request.
  Future<void> callAPI(
      {Future<Map<String, String>>? headers,
      Map<String, dynamic>? body,
      required String serviceUrl,
      required String method,
      Map<String, String>? formData,
      required Function(Response) success,
      required Function(dynamic) error,
      bool showProcess = false,
      File? singleFile,
      // File? singleFile2,
      String? singleFileKey,
      // String? singleFileKey2,
      List<File>? multipleFile,
      List<String>? multipleFileKeysList,
      String? multipleFileKey}) async {
    // Check network connectivity if enabled
    if (isCheckNetworkConnectivity && !(await isInternetAvailable())) {
      kDebugPrint("is error---------------1 $isCheckNetworkConnectivity");
      if (isAlertDialogs) {
        // Display an error dialog for no internet connection
        kDebugPrint("error---------------1");
        if (!getBuildContext.mounted) return;
        apiAlertDialog(
          message: 'No internet connection',
          customErrorDialog: customErrorDialog,
          buildContext: getBuildContext, // Get BuildContext via callback
        );
      }
    }
    Future<Map<String, String>> getHeaders() async {
      if (headers != null) {
        kDebugPrint("headers -- '$headers'");
        return headers;
      } else {
        return {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Connection": "keep-alive" /* "Accept-Encoding": "gzip, deflate, br"*/
        };
      }
    }

    try {
      http.Response response;
      var header = await getHeaders();
      kDebugPrint("headers -- '$header'");

      if (showProcess) {
        // Show loading dialog when 'showProcess' is true
        if (!getBuildContext.mounted) return;
        showLoadingDialog(
          customLoadingDialog: customLoadingDialog,
          buildContext: getBuildContext, // Get BuildContext via callback
        );
      }

      final stopwatch = Stopwatch()
        ..start(); // Start a timer if 'isCallBackTime' is true

      if (method == 'GET') {
        response = await http.get(
          Uri.parse(serviceUrl),
          headers: header,
        );
      } else if (method == 'POST') {
        response = await http.post(
          Uri.parse(serviceUrl),
          headers: header,
          body: body == null ? null : jsonEncode(body),
        );
      } else if (method == 'PATCH') {
        response = await http.patch(
          Uri.parse(serviceUrl),
          headers: header,
          body: body == null ? null : jsonEncode(body),
        );
      } else if (method == 'PUT') {
        response = await http.put(
          Uri.parse(serviceUrl),
          headers: header,
          body: body == null ? null : jsonEncode(body),
        );
      } else if (method == 'DELETE') {
        response = await http.delete(
          Uri.parse(serviceUrl),
          headers: header,
        );
      } else if (method == 'FORM') {
        http.MultipartRequest request = http.MultipartRequest(
          method,
          Uri.parse(serviceUrl),
        );
        request.headers.addAll(header);
        if (formData != null) {
          request.fields.addAll(formData);
        }
        if (singleFile != null) {
          request.files.add(await http.MultipartFile.fromPath(
            singleFileKey!,
            singleFile.path,
          ));
        }

        if (multipleFileKey != null) {
          if (multipleFileKeysList != null) {
            if (multipleFileKeysList.isNotEmpty) {
              for (var i = 0; i < multipleFile!.length; i++) {
                request.files.add(await http.MultipartFile.fromPath(
                    multipleFileKeysList[i], multipleFile[i].path));
              }
            }
          } else {
            if (multipleFile!.isNotEmpty) {
              for (File element in multipleFile) {
                request.files.add(await http.MultipartFile.fromPath(
                  multipleFileKey,
                  element.path,
                ));
              }
            }
          }
        }

        kDebugPrint("FORM FIELDS - ${request.fields}");
        kDebugPrint("FORM FILES - ${request.files}");
        response = await http.Response.fromStream(await request.send());
      } else {
        throw ArgumentError('Invalid method: $method');
      }

      if (isCallBackTime) {
        // Stop the timer and print the API request time if 'isCallBackTime' is true
        stopwatch.stop();
        kDebugPrint(
            'API request took ${stopwatch.elapsedMilliseconds} milliseconds');
      }

      if (response.statusCode >= 400) {
        if (isAlertDialogs) {
          // Display an error dialog for exceptions
          kDebugPrint("error---------------*");
          if (!getBuildContext.mounted) return;
          apiAlertDialog(
            message: 'An error occurred: $response',
            customErrorDialog: customErrorDialog,
            buildContext: getBuildContext, // Get BuildContext via callback
          );
        }
        // Handle errors, including HTTP status codes 400 and above
        error(response);
      } else {
        success(response);
      }
    } catch (e) {
      kDebugPrint("is error---------------+ $customErrorDialog");
      // Hide the loading dialog when 'showProcess' is true
      if (showProcess) {
        if (!getBuildContext.mounted) return;
        hideLoadingDialog(
            buildContext: getBuildContext); // Get BuildContext via callback
      }
      if (isAlertDialogs) {
        // Display an error dialog for exceptions
        kDebugPrint("error---------------2");
        if (!getBuildContext.mounted) return;
        apiAlertDialog(
          message: 'An error occurred: $e',
          customErrorDialog: customErrorDialog,
          buildContext: getBuildContext, // Get BuildContext via callback
        );
      }
      error(e);
    } finally {
      if (showProcess && !isAlertDialogs) {
        // Hide the loading dialog when 'showProcess' is true
        if (getBuildContext.mounted) {
          hideLoadingDialog(
              buildContext: getBuildContext); // Get BuildContext via callback
        }
      }
    }
  }
}
