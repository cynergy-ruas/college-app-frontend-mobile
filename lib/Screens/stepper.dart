import 'package:flutter/material.dart';

List<Step> steps = 
[
                    Step(
                      title: Text(
                        'Name',
                        style: TextStyle(color: Color(0xFF8E8E8E)),
                      ),
                      content: Row(
                        children: [
                          Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Color(0xFF8E8E8E)),
                              decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF8E8E8E))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text(
                        'Registration Number',
                        style: TextStyle(color: Color(0xFF8E8E8E)),
                      ),
                      content: Row(
                        children: [
                          Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Color(0xFF8E8E8E)),
                              decoration: InputDecoration(
                                  hintText: '1XETXXXXXX',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF8E8E8E))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text(
                        'Department',
                        style: TextStyle(color: Color(0xFF8E8E8E)),
                      ),
                      content: Row(
                        children: [
                          Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Color(0xFF8E8E8E)),
                              decoration: InputDecoration(
                                  hintText: 'FET',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF8E8E8E))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text(
                        'Batch',
                        style: TextStyle(color: Color(0xFF8E8E8E)),
                      ),
                      content: Row(
                        children: [
                          Icon(Icons.account_circle, color: Color(0xFF8E8E8E)),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Color(0xFF8E8E8E)),
                              decoration: InputDecoration(
                                  hintText: '20XX',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF8E8E8E))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];


