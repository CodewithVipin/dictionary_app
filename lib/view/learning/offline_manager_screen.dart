import 'package:flutter/material.dart';
import 'dart:async';

class OfflineManagerScreen extends StatefulWidget {
  const OfflineManagerScreen({super.key});

  @override
  State<OfflineManagerScreen> createState() => _OfflineManagerScreenState();
}

class _OfflineManagerScreenState extends State<OfflineManagerScreen> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  bool _isOfflineEnabled = false;

  void _startDownload() {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          _downloadProgress += 0.05;
          if (_downloadProgress >= 1.0) {
            _isDownloading = false;
            _isOfflineEnabled = true;
            timer.cancel();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Essential Offline Pack Updated!")),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offline Settings")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildStatusHeader(),
          const SizedBox(height: 30),
          _buildPackListItem(
            "Essential Word Pack",
            "5,000 top words for daily use",
            "12 MB",
            Icons.book,
            true,
          ),
          _buildPackListItem(
            "Advanced Academic Pack",
            "GRE, GMAT, and IELTS words",
            "25 MB",
            Icons.school,
            false,
          ),
          _buildPackListItem(
            "Idioms & Phrasal Verbs",
            "Native expressions & usage",
            "8 MB",
            Icons.forum,
            false,
          ),
          const SizedBox(height: 40),
          _buildOfflineToggle(),
          const SizedBox(height: 20),
          const Text(
            "Offline mode allows you to search for meanings even without an internet connection. Downloaded packs are stored securely on your device.",
            style: TextStyle(color: Colors.grey, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _isOfflineEnabled ? Colors.green.shade50 : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isOfflineEnabled
              ? Colors.green.shade200
              : Colors.blue.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _isOfflineEnabled ? Icons.cloud_done : Icons.cloud_off,
            size: 40,
            color: _isOfflineEnabled ? Colors.green : Colors.blue,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOfflineEnabled ? "Offline Ready" : "Online Only",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _isOfflineEnabled
                      ? "Search works without internet"
                      : "Connect to internet for full details",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackListItem(
    String title,
    String subtitle,
    String size,
    IconData icon,
    bool isEssential,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: _isDownloading && isEssential
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  value: _downloadProgress,
                  strokeWidth: 3,
                ),
              )
            : Text(
                size,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
        onTap: isEssential ? _startDownload : null,
      ),
    );
  }

  Widget _buildOfflineToggle() {
    return SwitchListTile(
      title: const Text(
        "Smart Offline Mode",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "Automatically switch to local data when internet is slow",
      ),
      value: _isOfflineEnabled,
      onChanged: (val) => setState(() => _isOfflineEnabled = val),
      inactiveTrackColor: Colors.grey.shade200,
    );
  }
}
