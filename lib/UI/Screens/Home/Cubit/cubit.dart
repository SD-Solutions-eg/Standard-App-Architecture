import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../MainImports/main_imports.dart';
import '../../../../Data/API/sigin_up_data.dart';
import 'states.dart';

XFile? businessLogo;
XFile? businessCover;

class FilePhoto {
  static XFile? userImage;
  static XFile? businessLogo;
  static XFile? businessCover;
  static const String user = 'User';
  static const String cover = 'Cover';
  static const String logo = 'Logo';
}

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  ///controllers variables
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController shortBioController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countyController = TextEditingController();

  //business
  TextEditingController brandNameController = TextEditingController();
  TextEditingController brandDescriptionsController = TextEditingController();
  TextEditingController openTimeController = TextEditingController();
  TextEditingController closeTimeController = TextEditingController();
  TextEditingController locationUrlController = TextEditingController();

  TextEditingController verificationEmailController = TextEditingController();

  ///Date picker
  final format = DateFormat("yyyy-MM-dd");

  DateTime lastDate = DateTime.now();

  Future<File?> openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      // SignUpData.pdfFile = File(result.files.single.path!);
      // print('file name is :');
      // print(SignUpData.pdfFile!.path.split('/').last);
      // emit(PickPDFState());
      // return SignUpData.pdfFile;
    } else {
      print('Error while picking a file!');
      emit(PickPDFState());
      return null;
    }
  }

  pickDate(context) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(FocusNode());
    date = await showDatePicker(
      context: context,
      initialDate: DateTime(lastDate.year - 1),
      firstDate: DateTime(1900),
      lastDate: DateTime(lastDate.year - 1),
      builder: (context, child) => StyleManager.selectDateTime(context, child),
    );
    dateController.text = format.format(date ?? DateTime.now());
    emit(PickDateState());
  }

  String? gender;

  chooseGender(String? val) {
    gender = val!;
    // SignUpData.signUpPersonalData.gender = gender!;
    emit(ChooseGenderState());
  }

  routeImage(String route, chooseSort) async {
    if (chooseSort == false) {
      switch (route) {
        case FilePhoto.user:
          FilePhoto.userImage = await cameraPicker();
          break;
        case FilePhoto.cover:
          FilePhoto.businessCover = await cameraPicker();
          break;
        case FilePhoto.logo:
          FilePhoto.businessLogo = await cameraPicker();
          break;
      }
    } else {
      switch (route) {
        case FilePhoto.user:
          FilePhoto.userImage = await galleryPicker();
          break;
        case FilePhoto.cover:
          FilePhoto.businessCover = await galleryPicker();
          break;
        case FilePhoto.logo:
          FilePhoto.businessLogo = await galleryPicker();
          break;
      }
    }
  }

  cameraPicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? img = await _picker.pickImage(source: ImageSource.camera);

    //userImage = img!;
    print(img!.path);
    emit(CameraPickerState());
    return img;
  }

  confirmBtn() {
    emit(ConfirmBtnState());
  }

  galleryPicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);

    // userImage = img!;
    print(img!.path);
    emit(GalleryPickerState());
    return img;
  }

  var uploadImg;

  // if (FilePhoto.userImage != null) {
  // uploadImg = MultipartFile.fromFileSync(FilePhoto.userImage!.path,
  // filename: FilePhoto.userImage!.path.split('/').last);
  // }

  dispose() {
    SignUpCubit? cubit;
    emailController.dispose();
    passwordController.dispose();
    cubit!.dispose();
  }
}
