import 'package:devtoys/domain/models/categories/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tool.dart';

class HtmlEncoderTool implements Tool{
  @override
  IconData get icon => Icons.code;

  @override
  String get name => "html".tr;
  
  @override
  String get route => "/encoders/html";
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement category
  Category get category => throw UnimplementedError();
}