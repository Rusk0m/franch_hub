class FranchiseTerms {
  final double initialInvestment;
  final double royaltyPercent;
  final double? unitPrice;
  final double? variableCostsPerUnit;

  FranchiseTerms(
      {required this.initialInvestment,
      required this.royaltyPercent,
      this.unitPrice,
      this.variableCostsPerUnit});
}
