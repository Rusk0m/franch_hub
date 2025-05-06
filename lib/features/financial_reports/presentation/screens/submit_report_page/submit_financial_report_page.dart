import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/presentation/bloc/financial_report_bloc/financial_report_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class SubmitFinancialReportPage extends StatefulWidget {
  final FranchiseBranch branch;

  const SubmitFinancialReportPage({
    super.key,
    required this.branch,
  });

  @override
  State<SubmitFinancialReportPage> createState() => _SubmitFinancialReportPageState();
}

class _SubmitFinancialReportPageState extends State<SubmitFinancialReportPage> {
  final _formKey = GlobalKey<FormState>();

  int year = DateTime.now().year;
  int month = DateTime.now().month;

  final _revenueController = TextEditingController();
  final _netProfitController = TextEditingController();
  final _totalAssetsController = TextEditingController();
  final _ownCapitalController = TextEditingController();
  final _liabilitiesController = TextEditingController();
  final _inventoryController = TextEditingController();
  final _initialInvestmentController = TextEditingController();
  final _fixedCostsController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _variableCostsController = TextEditingController();
  final _cashInflowController = TextEditingController();
  final _cashOutflowController = TextEditingController();
  final _royaltyController = TextEditingController();

  @override
  void dispose() {
    _revenueController.dispose();
    _netProfitController.dispose();
    _totalAssetsController.dispose();
    _ownCapitalController.dispose();
    _liabilitiesController.dispose();
    _inventoryController.dispose();
    _initialInvestmentController.dispose();
    _fixedCostsController.dispose();
    _unitPriceController.dispose();
    _variableCostsController.dispose();
    _cashInflowController.dispose();
    _cashOutflowController.dispose();
    _royaltyController.dispose();
    super.dispose();
  }

  void _submit() {
    final l10n = S.of(context)!;
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final report = FinancialReport(
          id: const Uuid().v4(),
          branchId: widget.branch.id,
          franchiseId: widget.branch.franchiseId,
          year: year,
          month: month,
          submittedAt: DateTime.now(),
          revenue: double.parse(_revenueController.text.trim()),
          netProfit: double.parse(_netProfitController.text.trim()),
          totalAssets: double.parse(_totalAssetsController.text.trim()),
          ownCapital: double.parse(_ownCapitalController.text.trim()),
          liabilities: double.parse(_liabilitiesController.text.trim()),
          inventory: double.parse(_inventoryController.text.trim()),
          initialInvestment: double.parse(_initialInvestmentController.text.trim()),
          fixedCosts: double.parse(_fixedCostsController.text.trim()),
          unitPrice: double.parse(_unitPriceController.text.trim()),
          variableCostsPerUnit: double.parse(_variableCostsController.text.trim()),
          cashInflow: double.parse(_cashInflowController.text.trim()),
          cashOutflow: double.parse(_cashOutflowController.text.trim()),
          royaltyPercent: double.parse(_royaltyController.text.trim()),
        );

        context.read<FinancialReportBloc>().add(SubmitReportEvent(report));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.dataError(e.toString()))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.newFinancialReportTitle)),
      body: BlocConsumer<FinancialReportBloc, FinancialReportState>(
        listener: (context, state) {
          if (state is FinancialReportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.reportSubmittedSuccess)),
            );
            Navigator.pop(context);
          } else if (state is FinancialReportError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.errorMessage(state.message))),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildNumberField(_revenueController, l10n.revenueLabel),
                  _buildNumberField(_netProfitController, l10n.netProfitLabel),
                  _buildNumberField(_totalAssetsController, l10n.totalAssetsLabel),
                  _buildNumberField(_ownCapitalController, l10n.ownCapitalLabel),
                  _buildNumberField(_liabilitiesController, l10n.liabilitiesLabel),
                  _buildNumberField(_inventoryController, l10n.inventoryLabel),
                  _buildNumberField(_initialInvestmentController, l10n.initialInvestmentLabel),
                  _buildNumberField(_fixedCostsController, l10n.fixedCostsLabel),
                  _buildNumberField(_unitPriceController, l10n.unitPriceLabel),
                  _buildNumberField(_variableCostsController, l10n.variableCostsLabel),
                  _buildNumberField(_cashInflowController, l10n.cashInflowLabel),
                  _buildNumberField(_cashOutflowController, l10n.cashOutflowLabel),
                  _buildNumberField(_royaltyController, l10n.royaltyPercentLabelReport),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: state is FinancialReportLoading ? null : _submit,
                    child: Text(l10n.submitReportButton),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    final l10n = S.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        validator: (value) {
          if (value == null || value.isEmpty) return l10n.requiredFieldError;
          final number = double.tryParse(value);
          if (number == null) return l10n.invalidNumberError;
          if (number.isNaN || number.isInfinite) return l10n.invalidNumberFormatError;
          return null;
        },
      ),
    );
  }
}