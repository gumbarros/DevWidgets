import '../models/categories/formatters_category.dart';
import '../models/categories/category.dart';
import '../models/categories/converters_category.dart';
import '../models/categories/encoders_category.dart';

class CategoriesFactory{
  static List<Category> getCategories(){
    return [ConvertersCategory(), EncodersCategory(), FormattersCategory()];
  }
}