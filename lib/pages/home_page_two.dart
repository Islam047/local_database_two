import 'package:flutter/material.dart';
import 'package:local_database/model/user_model.dart';
import 'package:local_database/service/db_Service.dart';

class HomePageTwo extends StatefulWidget {
  static const String id = '/home_page_two';

  const HomePageTwo({Key? key}) : super(key: key);

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void doLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String address = addressController.text.trim();
    String number = numberController.text.trim();
    User user = User(
        email: email, password: password, number: number, address: address);
    DBService().storeUser(user);
    print('${DBService().getUser().email} saved successfully');
    print('${DBService().getUser().password} saved successfully');
    print('${DBService().getUser().number} saved successfully');
    print('${DBService().getUser().address} saved successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff077f7b),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 30, bottom: 30),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 70, right: 35, left: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _itemsEachField(
                              controller: emailController,
                              text: 'Email',
                              title: 'Email'),
                          _itemsEachField(
                              controller: numberController,
                              text: 'Number',
                              title: 'Number'),
                          _itemsEachField(
                              controller: numberController,
                              text: 'Address',
                              title: 'Address'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color(0xff077f7b),
                        onPressed: doLogin,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'OR',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 100,
                          ),
                          InkWell(
                              child: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 48,
                          )),
                          SizedBox(
                            width: 45,
                          ),
                          InkWell(
                            child: Image(
                              fit: BoxFit.cover,
                              height: 45,
                              width: 45,
                              image: AssetImage(
                                'assets/images/img_1.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          InkWell(
                            child: Image(
                              fit: BoxFit.cover,
                              height: 45,
                              width: 45,
                              image: AssetImage(
                                'assets/images/img_2.png',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _itemsEachField(
      {required String text,
      required TextEditingController controller,
      required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                hintText: text,
                hintStyle: const TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }
}
