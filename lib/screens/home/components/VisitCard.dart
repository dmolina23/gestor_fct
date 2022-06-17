import 'package:flutter/material.dart';

class VisitCard extends StatefulWidget {
  const VisitCard(
      {Key? key,
      required this.date,
      required this.companyName,
      required this.accepted})
      : super(key: key);

  final String date;
  final String companyName;
  final bool accepted;

  @override
  _VisitCardState createState() => _VisitCardState();
}

class _VisitCardState extends State<VisitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      widget.companyName,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontFamily: 'Poppins', fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                    child: Text(
                      widget.date,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            widget.accepted
                ? Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFF8898F),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.clear_outlined,
                          color: Color(0xFFFF1020),
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF8898F),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.clear_outlined,
                              color: Color(0xFFFF1020),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF459023),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
