import 'package:fitness_meal_helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );
  late AudioPlayer audioPlayer;
  bool _isRunning = false;
  double _sliderValue = 0;
  int _remainingTime = 0;
  double _initialTime = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    _stopWatchTimer.rawTime.listen((value) async {
      setState(() {
        _remainingTime = value;
        if (_isRunning) {
          _sliderValue = value / (60 * 1000);
        }
      });

      if (value <= 0 && _isRunning) {
        await audioPlayer.play(AssetSource('audio/laser.mp3'));
        _stopWatchTimer.onStopTimer();
        setState(() {
          _isRunning = false;
          _sliderValue = 0;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Timer ${(_initialTime.toStringAsFixed(0))} menit telah selesai",
                textAlign: TextAlign.center,
              ),
              duration: const Duration(seconds: 7),
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _stopWatchTimer.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_sliderValue > 0) {
      _initialTime = _sliderValue;
      final timeInMillis = (_sliderValue * 60 * 1000).toInt();
      _stopWatchTimer.setPresetTime(mSec: timeInMillis, add: false);
      _stopWatchTimer.onStartTimer();
      setState(() {
        _isRunning = true;
        _remainingTime = timeInMillis;
      });
    }
  }

  void _pauseTimer() {
    _stopWatchTimer.onStopTimer();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopWatchTimer.onResetTimer();
    setState(() {
      _isRunning = false;
      _sliderValue = 0;
      _remainingTime = 0;
      _initialTime = 0;
    });
  }

  void _adjustTime(double value) {
    if (!_isRunning) {
      final timeInMillis = (value * 60 * 1000).toInt();
      setState(() {
        _sliderValue = value;
        _remainingTime = timeInMillis;
        _initialTime = value;
      });
      _stopWatchTimer.setPresetTime(mSec: timeInMillis, add: false);
    }
  }

  String _formatTime(int milliseconds) {
    final minutes = (milliseconds / (60 * 1000)).floor();
    final seconds = ((milliseconds % (60 * 1000)) / 1000).floor();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0).copyWith(bottom: 32.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kBackgroundColor, // Sesuaikan dengan warna latar belakang
        borderRadius: BorderRadius.circular(18.0), // Radius border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Warna shadow
            spreadRadius: 2, // Seberapa jauh shadow menyebar
            blurRadius: 5, // Seberapa kabur shadow
            offset: const Offset(0, 1), // Posisi shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _remainingTime,
                builder: (context, snapshot) {
                  final displayTime = _isRunning
                      ? _formatTime(snapshot.data!)
                      : _formatTime((_sliderValue * 60 * 1000).toInt());
                  return Text(
                    displayTime,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  );
                },
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                onPressed: _sliderValue > 0 ? (_isRunning ? _pauseTimer : _startTimer) : null,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  backgroundColor: _isRunning ? kPrimaryColor : Colors.white,
                  side: const BorderSide(color: kPrimaryColor, width: 2),
                ),
                child: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                  color: _isRunning ? Colors.white : kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _resetTimer,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: kPrimaryColor, width: 2),
                ),
                child: const Icon(
                  Icons.refresh,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 60,
            divisions: 60,
            label: '${_sliderValue.toStringAsFixed(0)} min',
            onChanged: _isRunning ? null : (value) {
              _adjustTime(value);
            },
            activeColor: kPrimaryColor,
            inactiveColor: kPrimaryColor.withOpacity(0.5), // Atur warna untuk bagian tidak aktif
          ),
        ],
      ),
    );
  }
}
