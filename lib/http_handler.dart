/// This is the main library for the Http Handler package.
library http_handler;

// Import necessary Dart libraries
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io' show File;

import 'package:http/http.dart';

// Import the other parts of the DioHandler package
part 'src/network_connectivity.dart';
part 'src/custom_dialog.dart';
part 'src/network_call.dart';
