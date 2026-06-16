import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE5DD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leading: const BackButton(color: Color.fromARGB(255, 228, 225, 225)),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tessa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),

            const Spacer(),
            const Icon(Icons.videocam, color: Colors.white),
            const SizedBox(width: 16),
            const Icon(Icons.call, color: Colors.white),
            const SizedBox(width: 8),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _buildMessage(text: "Hey! How are you?", isMe: false),

                const SizedBox(height: 8),

                _buildMessage(text: "I'm okay!How about you?", isMe: true),

                const SizedBox(height: 8),

                _buildMessage(
                  text:
                      "Good to hear, I'm doing great too and I wanted to remind you about our meeting tomorrow.",
                  isMe: false,
                ),

                const SizedBox(height: 8),

                _buildMessage(text: "I'll be there!", isMe: true),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                const SizedBox(width: 8),

                // Text input field
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const Spacer(),

                CircleAvatar(
                  backgroundColor: const Color(0xFF075E54),
                  child: const Icon(Icons.mic, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage({required String text, required bool isMe}) {
    return Row(
      children: [
        if (isMe) const Spacer(flex: 2),

        // The chat bubble
        Container(
          constraints: const BoxConstraints(maxWidth: 220),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(128),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(text, style: const TextStyle(fontSize: 15)),
        ),

        if (!isMe) const Spacer(flex: 2),
      ],
    );
  }
}
