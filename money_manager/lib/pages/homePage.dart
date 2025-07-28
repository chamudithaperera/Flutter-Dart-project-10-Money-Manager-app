import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../app_colors.dart';
import '../widgets/total_balance_card.dart';
import '../widgets/transaction_item.dart';
import '../widgets/add_transaction_popup.dart';
import '../auth/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _transactions = [];
  bool _isLoading = true;
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUserAndTransactions();
  }

  Future<void> _loadUserAndTransactions() async {
    final user = await AuthService().getCurrentUser();
    setState(() {
      _username = user?['username'] ?? '';
    });
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    setState(() {
      _isLoading = true;
    });
    final user = await AuthService().getCurrentUser();
    if (user == null) {
      setState(() {
        _transactions = [];
        _isLoading = false;
      });
      return;
    }
    final response = await http.get(
      Uri.parse('http://localhost:8500/api/transactions?user=${user['email']}'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _transactions = data['transactions'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _transactions = [];
        _isLoading = false;
      });
    }
  }

  void _showAddTransactionPopup(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTransactionPopup(),
    );
    _fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate totals
    double totalIncome = 0;
    double totalExpense = 0;
    for (final t in _transactions) {
      final amount =
          (t['amount'] is num)
              ? t['amount'].toDouble()
              : double.tryParse(t['amount'].toString()) ?? 0.0;
      if (t['isExpense'] == true) {
        totalExpense += amount;
      } else {
        totalIncome += amount;
      }
    }
    double totalBalance = totalIncome - totalExpense;
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionPopup(context),
        backgroundColor: AppColors.primaryOrange,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Top Row
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.lightGray,
                    backgroundImage: const AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        _username ?? '',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.darkBlue),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Total Balance Card
              TotalBalanceCard(
                totalBalance: 'Rs ${totalBalance.toStringAsFixed(2)}',
                income: 'Rs ${totalIncome.toStringAsFixed(2)}',
                expense: 'Rs ${totalExpense.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 24),

              // Recent Transactions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recent Transactions List
              Expanded(
                child:
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _transactions.isEmpty
                        ? const Center(child: Text('No transactions yet.'))
                        : ListView.builder(
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final t = _transactions[index];
                            return TransactionItem(
                              icon:
                                  Icons
                                      .fastfood, // TODO: Map icon string to IconData
                              title: t['title'] ?? '',
                              time: t['time'] ?? '',
                              amount:
                                  t['isExpense'] == true
                                      ? '-Rs ${t['amount']}'
                                      : '+Rs ${t['amount']}',
                              isExpense: t['isExpense'] ?? true,
                              comment: t['comment'] ?? '',
                              date:
                                  DateTime.tryParse(t['date'] ?? '') ??
                                  DateTime.now(),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
