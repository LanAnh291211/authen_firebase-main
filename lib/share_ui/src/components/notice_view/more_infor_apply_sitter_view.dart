import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MoreInforApplySitterView extends StatelessWidget {
  const MoreInforApplySitterView({
    super.key,
    this.onBack,
    this.onProceed,
  });

  final VoidCallback? onBack;
  final VoidCallback? onProceed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(top: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Before we proceed...',
                style: TextStyles.title24SemiBold,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Trust is a crucial element that facilitates our work.\n\nBeing consistent & dependable helps us maintain the best possible experience for our parents & a peace of mind when booking with Aunty!\n\nTo start your babysitting journey with us,\n',
                style: TextStyles.componentColumnContent,
              ),
              const Text(
                'We require: ',
                style: TextStyles.componentColumnTitle,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary,
                          border: Border.all(
                              color: AppColors.primaryShade20,
                              width: 4,
                              strokeAlign: BorderSide.strokeAlignOutside),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyles.caption10Regular
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        height: 58,
                        width: 2,
                        color: AppColors.primaryShade20,
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary,
                          border: Border.all(
                              color: AppColors.primaryShade20,
                              width: 4,
                              strokeAlign: BorderSide.strokeAlignOutside),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyles.caption10Regular
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 82,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Application Form',
                                style: TextStyles.componentColumnTitle
                                    .copyWith(color: AppColors.primary),
                              ),
                              const Flexible(
                                child: Text(
                                  'NRIC/Passport number \nSingapore Police Force (SPF check)',
                                  style: TextStyles.componentColumnContent,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 82,
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Review Process',
                                style: TextStyles.componentColumnTitle
                                    .copyWith(color: AppColors.primary),
                              ),
                              const Flexible(
                                child: Text(
                                  'Wait for Aunty to contact you. Successful applicants will be contacted upon approval and you can log into your sitter account.',
                                  style: TextStyles.componentColumnContent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Our team of sitters are a special bunch. Come be part of our village today!',
                style: TextStyles.smallBody16SemiBold
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(
                height: 65,
                width: 10,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(20.0).copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(
              title: 'Proceed With Application',
              style: FlatButtonStyles.primary,
              onPressed: onProceed,
            ),
          ],
        ),
      ),
    );
  }
}
