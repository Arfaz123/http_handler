
# HttpHandler

![Pub Version](https://img.shields.io/pub/v/http_handler)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

---

## Introduction

HttpHandler is a Flutter package designed to simplify network API calls using the Dio HTTP client. It provides utility functions and customization options to streamline API request handling in your Flutter applications.

## Features

- Simplified API calls with Dio.
- Customizable error and loading dialogs.
- Network connectivity check.
- Callback time measurement.

---

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
    - [Import](#import-the-package)
    - [Create an Instance](#create-a-httphandler-instance)
    - [Make API Requests](#make-api-requests)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

To use HttpHandler in your Flutter project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  http_handler: <latest_version>
```

Then, run `flutter pub get` to install the package.

---

## Usage

### Import the Package

First, import the `http_handler` package in your Dart file:

```dart
import 'package:http_handler/http_handler.dart';
```

### Create a HttpHandler Instance

Create an instance of `HttpHandler` by providing a Dio instance and other optional parameters:

```dart
  final httpHandler = HttpHandler(
  getBuildContext: context, // Required: Provide context
  customErrorDialog: MyCustomErrorDialog(), // Optional: Provide a custom error dialog widget
  customLoadingDialog: MyCustomLoadingDialog(), // Optional: Provide a custom loading dialog widget
  isCheckNetworkConnectivity: true, // Optional: Enable network connectivity check
  isAlertDialogs: true, // Optional: Show alert dialogs for errors
  isCallBackTime: true, // Optional: Measure API callback time (debug mode)
);
```

Replace `MyCustomErrorDialog()` and `MyCustomLoadingDialog()` with your actual custom error and loading dialog widgets if needed.

### Make API Requests

To make an API request and handle responses, use the `callAPI()` method:

```dart
httpHandler.callAPI(
  serviceUrl: 'https://api.example.com/data',
  method: 'GET',
  success: (response) {
    // Handle successful response here
    print('API Request Successful');
    print(response.data);
  },
  error: (error) {
    // Handle error response here
    print('API Request Error');
    print(error);
  },
  showProcess: true, // Set to true to display a loading dialog
);
```

---

## Example

You can find an example of how to use HttpHandler in the `example` folder of this package. To run the example, follow these steps:

1. Clone this repository.
2. Navigate to the `example` folder.
3. Run `flutter run` to launch the example app.

---

## Get in touch

If you have any questions, feel free to reach out:

- Email: chhapawalaarfaz@gmail.com
- GitHub: [@Arfaz123](https://github.com/Arfaz123)
- LinkedIn: [@Arfaz Chhapawala](https://www.linkedin.com/in/arfaz-chhapawala-501357234)
- YouTube: [@devfaaz](https://www.youtube.com/@devfaaz)

---

## Contributing

Contributions to the `http_handler` package are welcome! If you find a bug or want to add a new feature, feel free to open an issue or submit a pull request.

## Contributors

<a href="https://github.com/Arfaz123/http_handler/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=Arfaz123/http_handler" />
</a>

---

## License

This package is released under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to explore the features of the DioHandler package and customize it to suit your needs. If you have any questions or feedback, don't hesitate to reach out. Happy coding!