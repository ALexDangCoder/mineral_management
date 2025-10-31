import 'package:bnv_opendata/config/resources/styles.dart';
import 'package:bnv_opendata/widgets/nft_view/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NFTCountdown extends StatefulWidget {
  final int time;

  const NFTCountdown({Key? key, required this.time}) : super(key: key);

  @override
  _NFTCountdownState createState() => _NFTCountdownState();
}

class _NFTCountdownState extends State<NFTCountdown> {
  final TimeBloc _bloc = TimeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(StartEvent(widget.time));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(33),
      child: Container(
        padding:
            const EdgeInsets.only(left: 17, top: 16, right: 17, bottom: 14),
        height: 281,
        width: 343,
        decoration: BoxDecoration(
          color: const Color(0xFF282C37),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reserve price',
              style: textNormal(Colors.black12, 10),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 29,
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/img_coin.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '250,000,000 DFY',
                    style: textNormal(Colors.yellow, 22),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '~100,000,000',
              style: textNormal(Colors.white, 14),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Auction ends in:',
              style: textNormal(Colors.black12, 14),
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<TimeBloc, TimeState>(
              bloc: _bloc,
              builder: (context, state) {
                final int time = state.timeDuration;
                return Row(
                  children: [
                    timeCountDown(setValueTime(time, 'Days'), 'Days'),
                    const SizedBox(
                      width: 24,
                    ),
                    timeCountDown(setValueTime(time, 'Hours'), 'Hours'),
                    const SizedBox(
                      width: 24,
                    ),
                    timeCountDown(setValueTime(time, 'Mins'), 'Mins'),
                    const SizedBox(
                      width: 24,
                    ),
                    timeCountDown(setValueTime(time, 'Secs'), 'Secs'),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 19,
            ),
            Center(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFDBA83D),
                      Color(0xFFEBB23A),
                      Color(0xFFE9AD30),
                      Color(0xFFEDB53F),
                      Color(0xFFF4D289),
                      Color(0xFFF9C65B),
                      Color(0xFFEDB53F),
                      Color(0xFFE9AD30),
                      Color(0xFFEBB23A),
                      Color(0xFFDBA83D),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(),
                  child: Text(
                    'Place a bid',
                    style: textNormal(Colors.black, 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int setValueTime(int time, String timeType) {
    int value;
    int _time = time;
    switch (timeType) {
      case 'Days':
        value = _time ~/ (24 * 60 * 60);
        break;
      case 'Hours':
        value = _time ~/ (24 * 60 * 60);
        _time = _time - value * (24 * 60 * 60);
        value = _time ~/ (60 * 60);
        break;
      case 'Mins':
        value = _time ~/ (24 * 60 * 60);
        _time = _time - value * (24 * 60 * 60);
        value = _time ~/ (60 * 60);
        _time = _time - value * (60 * 60);
        value = _time ~/ 60;
        break;
      default:
        value = _time ~/ (24 * 60 * 60);
        _time = _time - value * (24 * 60 * 60);
        value = _time ~/ (60 * 60);
        _time = _time - value * (60 * 60);
        value = _time ~/ 60;
        value = _time - value * 60;
    }
    return value;
  }

  Widget timeCountDown(int time, String timeType) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 55,
      height: 57,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color(0xFF171A23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            timeType,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
