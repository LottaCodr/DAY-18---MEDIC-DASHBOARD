import 'package:flutter/material.dart';

class CountryDropDown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final void Function(String?)? onChanged;

  const CountryDropDown(
      {Key? key,
      required this.countries,
      required this.country,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        value: country,
        items: countries
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Image.asset(
                          'lib/assets/images/${e.toLowerCase()} usa.png'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(e,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      )),
    );
  }
}
