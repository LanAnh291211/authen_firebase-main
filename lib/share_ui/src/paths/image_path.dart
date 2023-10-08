enum ImagePath {
  amex('assets/images/amex.png'),
  fatherTakingCare('assets/images/father-taking-care.png'),
  guideSlidersConfirm(
      'assets/images/confirm-guide-slider.png'),
  guideSlidersCreate(
      'assets/images/create-guide-slider.png'),
  guideSlidersSearch(
      'assets/images/search-guide-slider.png'),
  guideSlidersChat('assets/images/inbox-guide-slider.png'),
  sitterWelcomeOnboard(
      'assets/images/sitter-welcome-onboard.png'),
  mastercard('assets/images/mastercard.png'),
  paynow('assets/images/paynow.png'),
  tutoralOne('assets/images/tutorial-one.png'),
  tutoralTwo('assets/images/tutorial-two.png'),
  visa('assets/images/visa.png'),
  wave('assets/images/wave.png'),
  welcomeOnboardAvailability(
      'assets/images/welcome-onboard-availability.png'),
  welcomeOnboardSchedule(
      'assets/images/welcome-onboard-schedule.png'),
  ;

  const ImagePath(this.assetName);
  final String assetName;

  static ImagePath? getCreditCard(String? brand) {
    switch (brand) {
      case 'paynow':
        return ImagePath.paynow;

      case 'visa':
        return ImagePath.visa;

      case 'mastercard':
        return ImagePath.mastercard;

      case 'amex':
        return ImagePath.amex;

      case 'discover':
        return null;

      default:
        return null;
    }
  }
}
