import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/financial_report_bloc/financial_report_bloc.dart';
import 'package:uuid/uuid.dart';

class SubmitFinancialReportPage extends StatefulWidget {
  final String branchId;
  final String franchiseId;

  const SubmitFinancialReportPage({
    super.key,
    required this.branchId,
    required this.franchiseId,
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
    if (_formKey.currentState?.validate() ?? false) {
      final report = FinancialReport(
        id: const Uuid().v4(),
        branchId: widget.branchId,
        franchiseId: widget.franchiseId,
        year: year,
        month: month,
        revenue: double.parse(_revenueController.text),
        netProfit: double.parse(_netProfitController.text),
        totalAssets: double.parse(_totalAssetsController.text),
        ownCapital: double.parse(_ownCapitalController.text),
        liabilities: double.parse(_liabilitiesController.text),
        inventory: double.parse(_inventoryController.text),
        initialInvestment: double.parse(_initialInvestmentController.text),
        fixedCosts: double.parse(_fixedCostsController.text),
        unitPrice: double.parse(_unitPriceController.text),
        variableCostsPerUnit: double.parse(_variableCostsController.text),
        cashInflow: double.parse(_cashInflowController.text),
        cashOutflow: double.parse(_cashOutflowController.text),
        royaltyPercent: double.parse(_royaltyController.text),
      );

      context.read<FinancialReportBloc>().add(SubmitReportEvent(report));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новый финансовый отчет')),
      body: BlocConsumer<FinancialReportBloc, FinancialReportState>(
        listener: (context, state) {
          if (state is FinancialReportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Отчет успешно отправлен')),
            );
            Navigator.pop(context);
          } else if (state is FinancialReportError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: ${state.message}')),
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
                  _buildNumberField(_revenueController, 'Выручка'),
                  _buildNumberField(_netProfitController, 'Чистая прибыль'),
                  _buildNumberField(_totalAssetsController, 'Общие активы'),
                  _buildNumberField(_ownCapitalController, 'Собственный капитал'),
                  _buildNumberField(_liabilitiesController, 'Обязательства'),
                  _buildNumberField(_inventoryController, 'Запасы'),
                  _buildNumberField(_initialInvestmentController, 'Начальные инвестиции'),
                  _buildNumberField(_fixedCostsController, 'Постоянные издержки'),
                  _buildNumberField(_unitPriceController, 'Цена за единицу товара'),
                  _buildNumberField(_variableCostsController, 'Переменные издержки'),
                  _buildNumberField(_cashInflowController, 'Приток денежных средств'),
                  _buildNumberField(_cashOutflowController, 'Отток денежных средств'),
                  _buildNumberField(_royaltyController, 'Процент роялти'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: state is FinancialReportLoading ? null : _submit,
                    child: const Text('Отправить отчет'),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Обязательное поле';
          if (double.tryParse(value) == null) return 'Введите число';
          return null;
        },
      ),
    );
  }
}
