import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:season/src/app/data/models/firestore_user.dart';
import 'package:season/src/app/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:season/src/view/home/pages/bottomNavigation.dart';


class HomeController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  Rx<User?> _user = FirebaseAuth.instance.currentUser.obs;

  String? get user => _user.value?.email;
  
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // ignore: avoid_print
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }
  
   void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      id: user.user!.uid as int,
      email: user.user!.email,
      name: name == null ? user.user?.displayName : name,
      
    ));
  }
}