import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isFormFilled = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkForm);
    messageController.addListener(_checkForm);
  }

  void _checkForm() {
    setState(() {
      isFormFilled =
          nameController.text.trim().isNotEmpty &&
              messageController.text.trim().isNotEmpty;
    });
  }

  void _sendMessage() {
    final name = nameController.text.trim();
    final message = messageController.text.trim();

    if (isFormFilled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thank you, $name! Message sent.')),
      );
      nameController.clear();
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Get in Touch',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: messageController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Your Message',
                    prefixIcon: const Icon(Icons.message),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.send),
                    label: const Text('Send Message'),
                    onPressed: isFormFilled ? _sendMessage : null, // disables the button
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFormFilled ? Colors.indigo : Colors.grey[400],
                      foregroundColor: isFormFilled ? Colors.white : Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}