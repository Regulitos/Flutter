import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/dominio/entidades/mensajes.dart';
import 'package:si_no_app/presentacion/providers/chat_proviers.dart';
import 'package:si_no_app/presentacion/widgets/chat/mi_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/chat/su_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/compartido/caja_de_texto.dart';

class ChatPantalla extends StatelessWidget {
  const ChatPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn1.gstatic.com/inages?q=tbn:ANd9GcSbxmzvX60XzJGdFfc_Oip_djcpzUkJ7GKQBc35uUfh-bYxjb',
            ),
          ),
        ),
        title: const Text('Emilia'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProviders = context.watch<ChatProviers>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProviders.mensajeLista.length,
                itemBuilder: (context, index) {
                  final mensaje = chatProviders.mensajeLista[index];

                  return (mensaje.deQuien == DeQuien.ella)
                      ? SuMensajeBurbuja(key: ValueKey('ella-$index'))
                      : MiMensajeBurbuja(
                          key: ValueKey('mio-$index'),
                          mensaje: mensaje,
                        );
                },
              ),
            ),
            CajadeTexto(
              onValue: (text) {
                if (text.trim().isNotEmpty) {
                  chatProviders.sendMenssage(text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
