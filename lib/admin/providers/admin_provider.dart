import 'dart:developer';
import 'dart:io';
import 'package:firebase_start/admin/models/Sliders.dart';
import 'package:firebase_start/admin/models/cart_product.dart';
import 'package:firebase_start/admin/models/category.dart';
import 'package:firebase_start/admin/views/screens/edit_category.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../app_router/app_router.dart';
import '../../data_reposetories/db_helper.dart';
import '../../data_reposetories/fireStore_helper.dart';
import '../../data_reposetories/storage_helper.dart';
import '../models/product.dart';

class AdminProvider extends ChangeNotifier {
  List<Slider>? allSliders;
  int totalPrice = 0;
  changeTotalPrice(int newTotal) {
    totalPrice = newTotal;
    notifyListeners();
  }

  AdminProvider() {
    getAllCategories();
    getAllSliders();
    getAllCartProducts();
  }
  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  // add new category
  File? imageFile;
  TextEditingController sliderTitleController = TextEditingController();
  TextEditingController sliderUrlController = TextEditingController();
  TextEditingController catNameArController = TextEditingController();
  TextEditingController catNameEnController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  pickImageForCategory() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addNewCategory() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            nameAr: catNameArController.text,
            nameEn: catNameEnController.text);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewCategory(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          getAllCategories();
          //allCategories!.add(category);
          notifyListeners();
          catNameArController.clear();
          catNameEnController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  addNewSlider() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            nameAr: catNameArController.text,
            nameEn: catNameEnController.text);
        String? id =
            await FirestoreHelper.firestoreHelper.addNewCategory(category);
        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          getAllCategories();
          //allCategories!.add(category);
          notifyListeners();
          catNameArController.clear();
          catNameEnController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  // get cateogies
  List<Category>? allCategories;
  List<Product>? allProducts;

  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  getAllProducts(String catId) async {
    allProducts = await FirestoreHelper.firestoreHelper.getAllProducts(catId);
    notifyListeners();
  }

  // delete category
  deleteCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  goToEditCategoryPage(Category category) {
    catNameArController.text = category.nameAr;
    catNameEnController.text = category.nameEn;
    AppRouter.appRouter.goToWidget(EditCategory(category));
  }

  updateCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.imageUrl = imageUrl;
    }
    Category newCategory = Category(
        id: category.id,
        imageUrl: category.imageUrl,
        nameAr: catNameArController.text.isEmpty
            ? category.nameAr
            : catNameArController.text,
        nameEn: catNameEnController.text.isEmpty
            ? category.nameEn
            : catNameEnController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories!.indexOf(category);
      allCategories![index] = newCategory;
      imageFile = null;
      catNameEnController.clear();
      catNameArController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  // delete category
  deleteSlider(Slider slider) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteSlider(slider.id!);
    if (deleteSuccess) {
      allSliders!.remove(slider);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey();
  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("products_images", imageFile!);
        Product product = Product(
            imageUrl: imageUrl,
            name: productNameController.text,
            description: productDescriptionController.text,
            price: productPriceController.text,
            size: productSizeController.text,
            count: 5,
            catId: catId);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewProduct(product);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          product.id = id;
          getAllProducts(catId);
          // allProducts?.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productSizeController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your Product has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  getAllSliders() async {
    allSliders = await FirestoreHelper.firestoreHelper.getAllSliders();
  }

  AddNewSlider() async {
    if (imageFile != null) {
      AppRouter.appRouter.showLoadingDialoug();
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("Slider_images", imageFile!);
      Slider slider = Slider(
          imageUrl: imageUrl,
          title: sliderTitleController.text,
          url: sliderUrlController.text);

      String? id = await FirestoreHelper.firestoreHelper.addNewSlider(slider);

      AppRouter.appRouter.hideDialoug();
      if (id != null) {
        slider.id = id;
        allSliders?.add(slider);
        notifyListeners();
        sliderTitleController.clear();
        sliderUrlController.clear();

        imageFile = null;
        notifyListeners();
        AppRouter.appRouter
            .showCustomDialoug('Success', 'Your Slider has been added');
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  List<CartProduct> allCartProducts = [];
  getAllCartProducts() async {
    totalPrice = 0;
    allCartProducts = await DbHelper.dbHelper.getAllCart();
    allCartProducts.map(
      (e) {
        log(e.price.toString());
       // return totalPrice = totalPrice + int.parse(e.price);
      },
    );
    changeTotalPrice(totalPrice);
    notifyListeners();
  }

  insertNewProduct(Product product) async {
    CartProduct cartProduct = CartProduct(
        name: product.name,
        imageUrl: product.imageUrl,
        count: product.count,
        price: ((int.parse(product.price)) * product.count).toString() ,
        id: product.id,
        size: product.size);

    await DbHelper.dbHelper.insertNewCartProduct(cartProduct);
    getAllCartProducts();
  }

  deleteCartProduct(CartProduct cartProduct) async {
    await DbHelper.dbHelper.deleteCartProduct(cartProduct);
    getAllCartProducts();
  }

  // update category
//   updateCategory()async{
//     FirestoreHelper.firestoreHelper.updateCategory(category)
}
