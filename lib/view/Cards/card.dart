import 'package:flutter/material.dart';
import 'package:ejercicio4/models.dart';

class PersonaCard extends StatelessWidget {
  const PersonaCard({
    super.key,
    required this.borderColor,
    required this.persona,
  });

  final Color borderColor;
  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              heightFactor: .9,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                text:
                                    '${persona.nombreUno} ${persona.nombreDos} ${persona.apellidoUno} ${persona.apellidoDos}',
                                children: [
                                  TextSpan(
                                    text: '\n${persona.puesto}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
                                    ),
                                  )
                                ],
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.home_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              persona.direccion,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            persona.telefono,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    persona.email,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Text(
                                  persona.website,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
