import 'package:flutter/material.dart';

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
                              child: const Text('Edit information'),
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
                                'Điều khoản sử dụng',
                                style: TextStyle(
                                  fontSize: 20,
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
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Màu chữ của nút
                              ),
                              child: const Text(
                                'Chính sách quyền riêng tư',
                                style: TextStyle(
                                  fontSize: 20,
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
                                backgroundColor:
                                    Colors.lightBlue, // Màu nền của nút
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ), // Màu chữ của nút
                              ),
                              child: const Text(
                                'Quy chế hoạt động',
                                style: TextStyle(
                                  fontSize: 20,
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
            ),
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
