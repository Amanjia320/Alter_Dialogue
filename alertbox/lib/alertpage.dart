// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:alertbox/provider/Alertprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Alertpage extends StatefulWidget {
  const Alertpage({super.key});

  @override
  State<Alertpage> createState() => _AlertpageState();
}

class _AlertpageState extends State<Alertpage> {
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dropprovider = Provider.of<DropdownProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Teal Pot',
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: SizedBox(
                      height: 600,
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Work Type',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropDownClass(
                            selectedValue: dropprovider.selectedWorkType,
                            onChanged: (value) {
                              dropprovider.updateWorkType(value);
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Experience level',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropDownClass(
                            selectedValue: dropprovider.selectedExperienceLevel,
                            onChanged: (value) {
                              dropprovider.updateExperienceLevel(value);
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Location',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          //DropDownClass(),
                          const SizedBox(
                            height: 7,
                          ),
                          // const DropDownClass(),
                          const SizedBox(
                            height: 7,
                          ),
                          // const DropDownClass(),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Estimated Budget',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ReusbaleRow(title: 'From', price: 66),
                              SizedBox(
                                width: 40,
                              ),
                              ReusbaleRow(title: 'To', price: 99),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Apply Filters')),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.filter_alt),
        ),
      ),
    );
  }
}

class DropDownClass extends StatefulWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;

  const DropDownClass({
    required this.selectedValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownClass> createState() => _DropDownClassState();
}

class _DropDownClassState extends State<DropDownClass> {
  //var selectedValue;
  @override
  Widget build(BuildContext context) {
    final dropprovider = Provider.of<DropdownProvider>(context);
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      hint: const Text(
        'Select an option',
        style: TextStyle(color: Colors.black),
      ), // Optional: Add a hint text
      value: widget
          .selectedValue, //Yes, that's correct! When you select a value from the dropdown, dropprovider.selectedWorkType is the value that will be assigned to the value parameter.
      items: const [
        DropdownMenuItem(
          value: 'Option 1',
          child: Text(
            'Option 1',
            style: TextStyle(color: Colors.black),
          ),
        ),
        DropdownMenuItem(
          value: 'Option 2',
          child: Text(
            'Option 2',
            style: TextStyle(color: Colors.black),
          ),
        ),
        DropdownMenuItem(
          value: 'Option 3',
          child: Text(
            'Option 3',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      onChanged: (value) {
        dropprovider.updateWorkType(value!);
      },
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  final String title;
  final int price;
  // ignore: prefer_const_constructors_in_immutables
  const ReusbaleRow({Key? key, required this.title, required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      price.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const Text(
                      '\$',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
