import 'package:flutter/material.dart';
class CheckoutPanel extends StatelessWidget {
  final Animation<double> animation;

  const CheckoutPanel({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "TOTAL",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          /// 🔥 AnimatedBuilder in POS
          AnimatedBuilder(
            animation: animation,
            builder: (_, __) {
              return Text(
                "₱${animation.value.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {},
            child: const Text("PAY"),
          ),
        ],
      ),
    );
  }
}
