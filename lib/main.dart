import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Requerido para conectar WebSocketChannel
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.100.7'), // Cambia por la dirección IP y el puerto del Android TV
  );

  void _sendCommand(String command) {
    channel.sink.add(command);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Control Remoto')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _sendCommand('UP'); // Ejemplo de enviar comando UP al Android TV
                },
                child: Text('Arriba'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendCommand('DOWN'); // Ejemplo de enviar comando DOWN al Android TV
                },
                child: Text('Abajo'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendCommand('LEFT'); // Ejemplo de enviar comando LEFT al Android TV
                },
                child: Text('Izquierda'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendCommand('RIGHT'); // Ejemplo de enviar comando RIGHT al Android TV
                },
                child: Text('Derecha'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendCommand('OK'); // Ejemplo de enviar comando OK al Android TV
                },
                child: Text('Ok'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendCommand('BACK'); // Ejemplo de enviar comando OK al Android TV
                },
                child: Text('Atras'),
              ),
              // Agrega más botones para otros comandos según tus necesidades
            ],
          ),
        ),
      ),
    );
  }
}
