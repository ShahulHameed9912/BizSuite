import 'package:bizsuite/views/commonwidgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<Settings> {
  bool orderNotifications = true;
  bool paymentAlerts = true;
  bool weeklyReports = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppbarWidget(title: "Settings"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _sectionCard(
              title: 'General',
              children: [
                _arrowTile(Icons.language, 'Language'),
                _arrowTile(Icons.currency_exchange, 'Currency'),
                _arrowTile(Icons.date_range, 'Date Format'),
                _arrowTile(Icons.calendar_today, 'DD/MM/YYYY'),
              ],
            ),
            const SizedBox(height: 16),
            _sectionCard(
              title: 'Notifications',
              trailing: const Text(
                'More',
                style: TextStyle(color: Colors.orange, fontSize: 12),
              ),
              children: [
                _switchTile(
                  Icons.notifications,
                  'Order Notifications',
                  orderNotifications,
                  (v) => setState(() => orderNotifications = v),
                ),
                _switchTile(
                  Icons.payments,
                  'Payment Alerts',
                  paymentAlerts,
                  (v) => setState(() => paymentAlerts = v),
                ),
                _switchTile(
                  Icons.bar_chart,
                  'Weekly Reports',
                  weeklyReports,
                  (v) => setState(() => weeklyReports = v),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _referFriend(),
            const SizedBox(height: 16),
            _sectionCard(
              children: [
                _arrowTile(Icons.palette, 'Appearance'),
                _arrowTile(Icons.security, 'Security'),
              ],
            ),
            const SizedBox(height: 16),
            _deleteAccount(),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Card
  Widget _sectionCard({
    String? title,
    Widget? trailing,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          if (title != null)
            ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              trailing: trailing,
            ),
          ...children,
        ],
      ),
    );
  }

  // 🔹 Arrow Tile
  Widget _arrowTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  // 🔹 Switch Tile
  Widget _switchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }

  // 🔹 Refer Friend Banner
  Widget _referFriend() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Refer a friend',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '30% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.card_giftcard, color: Colors.white, size: 36),
        ],
      ),
    );
  }

  // 🔹 Delete Account
  Widget _deleteAccount() {
    return ListTile(
      leading: const Icon(Icons.delete, color: Colors.red),
      title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
      onTap: () {},
    );
  }

  // 🔹 Card Decoration
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
