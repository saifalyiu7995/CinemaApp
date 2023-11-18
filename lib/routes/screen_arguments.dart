class ScreenArguments {
  final bool? showMarketFilter;
  final bool? showSideFilter;
  final bool? showHouseOrderNoFilter;
  final bool? showTicketNoFilter;
  final String? scripCode;
  final String? companyName;
  final bool? isTemporaryPassword;
  final bool? isFirstLogin;
  final String? screenTitle;

  const ScreenArguments(
      {this.showHouseOrderNoFilter = true,
      this.showMarketFilter = true,
      this.showSideFilter = true,
      this.showTicketNoFilter = false,
      this.scripCode,
      this.companyName,
      this.isTemporaryPassword = false,
      this.isFirstLogin = false,
      this.screenTitle});
}
