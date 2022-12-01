// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:service_charge_app/src/controller/ticket_controller.dart';

import '../entity/ticket.dart';

class ViewTicket extends StatefulWidget {
  ViewTicket({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewTicket> createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  TicketController ticketController = TicketController();
  late List<Ticket> ticketList;
  late String _sortColumnName;

  late bool _sortAscending;

  List<String>? _filterTexts;

  bool _willSearch = true;

  Timer? _timer;

  int? _latestTick;

  List<String> _selectedRowKeys = [];

  int _rowsPerPage = 10;

  @override
   initState()  {
    super.initState();
    
    _sortColumnName = 'browser';
    _sortAscending = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child :FutureBuilder(builder: builder)
      
      
      // Container(
      //   padding: const EdgeInsets.all(8.0),
      //   child: WebDataTable(
      //     header: Text('Tickets'),
      //     actions: [
      //       if (_selectedRowKeys.isNotEmpty)
      //         SizedBox(
      //           height: 50,
      //           width: 100,
      //           child: ElevatedButton(
      //             // color: Colors.red,
      //             child: Text(
      //               'Delete',
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             onPressed: () {
      //               print('Delete!');
      //               setState(() {
      //                 _selectedRowKeys.clear();
      //               });
      //             },
      //           ),
      //         ),
      //       Container(
      //         width: 300,
      //         child: TextField(
      //           decoration: InputDecoration(
      //             prefixIcon: Icon(Icons.search),
      //             hintText: 'increment search...',
      //             focusedBorder: const OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Color(0xFFCCCCCC),
      //               ),
      //             ),
      //             border: const OutlineInputBorder(
      //               borderSide: BorderSide(


        
      //                 color: Color(0xFFCCCCCC),
      //               ),
      //             ),
      //           ),
      //           onChanged: (text) {
      //             _filterTexts = text.trim().split(' ');
      //             _willSearch = false;
      //             _latestTick = _timer?.tick;
      //           },
      //         ),
      //       ),
      //     ],
      //     source: WebDataTableSource(
      //       sortColumnName: _sortColumnName,
      //       sortAscending: _sortAscending,
      //       filterTexts: _filterTexts,
      //       columns: [
      //         WebDataColumn(
      //           name: 'id',
      //           label: const Text('ticketID'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //         ),
      //         WebDataColumn(
      //           name: 'status',
      //           label: const Text('Status'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //         ),
      //         WebDataColumn(
      //           name: 'subject',
      //           label: const Text('Subject'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //         ),
      //         WebDataColumn(
      //           name: 'assignee',
      //           label: const Text('Assignee'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //         ),
      //         WebDataColumn(
      //           name: 'description',
      //           label: const Text('Description'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //         ),
      //         WebDataColumn(
      //           name: 'tracker',
      //           label: const Text('CSS grade'),
      //           dataCell: (value) => DataCell(Text('$value')),
      //           sortable: false,
      //         ),
      //       ],
      //       rows:  ticketController.getTicket()   
      //       ticketList.map((e) => e.toJson()).toList(),
      //       selectedRowKeys: _selectedRowKeys,
      //       onTapRow: (rows, index) {
      //         print('onTapRow(): index = $index, row = ${rows[index]}');
      //       },
      //       onSelectRows: (keys) {
      //         print('onSelectRows(): count = ${keys.length} keys = $keys');
      //         setState(() {
      //           _selectedRowKeys = keys;
      //         });
      //       },
      //       primaryKeyName: 'id',
      //     ),
      //     horizontalMargin: 100,
      //     onPageChanged: (offset) {
      //       print('onPageChanged(): offset = $offset');
      //     },
      //     onSort: (columnName, ascending) {
      //       print('onSort(): columnName = $columnName, ascending = $ascending');
      //       setState(() {
      //         _sortColumnName = columnName;
      //         _sortAscending = ascending;
      //       });
      //     },
      //     onRowsPerPageChanged: (rowsPerPage) {
      //       print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
      //       setState(() {
      //         if (rowsPerPage != null) {
      //           _rowsPerPage = rowsPerPage;
      //         }
      //       });
      //     },
      //     rowsPerPage: _rowsPerPage,
      //   ),
      // ),
    );
  }
}
