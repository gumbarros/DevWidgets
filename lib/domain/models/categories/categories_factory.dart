import 'formatters_category.dart';
import 'category.dart';
import 'converters_category.dart';
import 'encoders_category.dart';

class CategoriesFactory{
  static List<Category> getCategories(){
    return [ConvertersCategory(), EncodersCategory(), FormattersCategory()];
  }
}