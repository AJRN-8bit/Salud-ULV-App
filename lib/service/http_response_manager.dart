import 'dart:convert';
import 'package:flutter/material.dart ';
import 'package:http/http.dart' as http;

void manageHTTPResponse({
    required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess,
}){
    switch (response.statusCode){
        case 200:
            onSuccess();
            break;
        case 400:
            showSnackbar(context, json.decode(response.body)['message']);
            break;
        case 500:
            showSnackbar(context, json.decode(response.body)['message']);
            break;
        case 201:
            onSuccess();
            break;
    }
}

void showSnackbar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
}