import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/accounts/csbm.dart';

import 'csbh.dart';

class AccountFacePage extends StatelessWidget {
  const AccountFacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(width: 5, color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionalTranslation(
                  translation: const Offset(0.0,
                      0.3), // Di chuyển nửa dưới của hình tròn ra khỏi hình chữ nhật
                  child: ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(
                            width: 3,
                            color: Colors.lime), // Thêm viền cho hình tròn
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(0.6), // Màu và độ mờ của bóng
                    spreadRadius: 5, // Độ rộng của bóng
                    blurRadius: 7, // Độ mờ của bóng
                    offset: const Offset(0, 3), // Vị trí của bóng
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    20.0), // Đặt khoảng cách giữa nội dung và biên
                child: Column(
                  children: <Widget>[
                    // Đặt các widget của bạn ở đây
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 0.0,
                      ), // Đặt khoảng cách phù hợp giữa hình tròn và text
                      child: Text(
                        'Tên người dùng',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Inforfield(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0), // Cách lề bên trái 20px
                            child: ElevatedButton(
                              onPressed: () {
                                // Thêm hành động khi nhấn nút ở đây
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Màu chữ của nút
                              ),
                              child: const Text('Edit Avatar'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ), // Đẩy nút "Thay đổi avatar" sang bên phải
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 0.0), // Cách lề bên phải 20px
                            child: ElevatedButton(
                              onPressed: () {
                                // Thêm hành động khi nhấn nút ở đây
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Màu chữ của nút
                              ),
                              child: const Text('Edit background'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const CSField(),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(0.6), // Màu và độ mờ của bóng
                    spreadRadius: 5, // Độ rộng của bóng
                    blurRadius: 7, // Độ mờ của bóng
                    offset: const Offset(0, 3), // Vị trí của bóng
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    20.0), // Đặt khoảng cách giữa nội dung và biên
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Thêm hành động khi nhấn nút ở đây
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Viền màu đen // Màu chữ của nút
                              ),
                              child: const Text(
                                'Đăng xuất',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Thêm hành động khi nhấn nút ở đây
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Màu chữ của nút
                              ),
                              child: const Text(
                                'Đổi mật khẩu',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Inforfield extends StatelessWidget {
  const Inforfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 350,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: const Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: SizedBox(
                              width: 350, // Adjust the width as needed
                              child: Text(
                                'Tên người dùng: John Doe',
                                style: TextStyle(fontSize: 20),
                                softWrap: true,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 10,
                            child: SizedBox(
                              width: 350, // Adjust the width as needed
                              child: Text(
                                'Email: john.doe@example.com',
                                style: TextStyle(fontSize: 20),
                                softWrap: true,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 130,
                            left: 10,
                            child: SizedBox(
                              width: 350, // Adjust the width as needed
                              child: Text(
                                'Số điện thoại: +1 123-456-7890',
                                style: TextStyle(fontSize: 20),
                                softWrap: true,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 190,
                            left: 10,
                            child: SizedBox(
                              width: 350, // Adjust the width as needed
                              child: Text(
                                'Địa chỉ: 123 Main Street, City, Contry sđakjsadbkjábdjá',
                                style: TextStyle(fontSize: 20),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Màu nền của nút
                foregroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ), // Viền màu đen // Màu chữ của nút
              ),
              child: const Text('Thông tin cá nhân'),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Tên người dùng'),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Số điện thoại'),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Địa chỉ'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Thêm hành động xử lý thông tin người dùng ở đây
                              Navigator.pop(context); // Đóng bottom sheet
                            },
                            child: const Text('Lưu thông tin'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Màu nền của nút
                foregroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ), // Màu chữ của nút
              ),
              child: const Text('Edit information'),
            ),
          ),
        ),
      ],
    );
  }
}

class CSField extends StatelessWidget {
  const CSField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6), // Màu và độ mờ của bóng
            spreadRadius: 5, // Độ rộng của bóng
            blurRadius: 7, // Độ mờ của bóng
            offset: const Offset(0, 3), // Vị trí của bóng
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(20.0), // Đặt khoảng cách giữa nội dung và biên
        child: Column(
          children: <Widget>[
            // Đặt các widget của bạn ở đây
            const Padding(
              padding: EdgeInsets.only(
                top: 0.0,
              ), // Đặt khoảng cách phù hợp giữa hình tròn và text
              child: Text(
                'Trợ Giúp',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Thêm hành động khi nhấn nút ở đây
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CSBM()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Màu nền của nút
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ), // Viền màu đen // Màu chữ của nút
                      ),
                      child: const Text(
                        'Chính sách bảo mật',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Thêm hành động khi nhấn nút ở đây
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CSBH()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Màu nền của nút
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ), // Màu chữ của nút
                      ),
                      child: const Text(
                        'Chính sách bảo hành',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Thêm hành động khi nhấn nút ở đây
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Màu nền của nút
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ), // Màu chữ của nút
                      ),
                      child: const Text(
                        'Quy chế hoạt động',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
