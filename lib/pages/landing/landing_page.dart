import 'package:authen_firebase/a.dart';
import 'package:authen_firebase/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../../share_ui/shared_ui.dart';
import '../auth/register_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Svg(svgPath: SvgPath.logoLanding),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Kết nối để \n ',
                          style: TextStyles.title22Regular.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Khám phá',
                          style: TextStyles.title22SemiBold.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Button(
              title: 'Đăng ký cho 1 tài khoản mới',
              style: FlatButtonStyles.tertiary,
              onPressed: () async {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
              },
            ),
            const SizedBox(height: 8),
            Button(
              title: 'Đăng nhập',
              style: OutlinedButtonStyles.white,
              onPressed: () async {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
