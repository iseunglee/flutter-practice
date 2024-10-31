import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  final _blackColor = const Color(0xFF1F2123);
  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  Offset getOffset() {
    switch (order) {
      case 0:
        return const Offset(0, 0);
      case 1:
        return const Offset(0, -20);
      case 2:
        return const Offset(0, -40);
      default:
        return const Offset(0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      // 메서드로 정의
      offset: getOffset(),

      // 즉시 실행함수 사용 
      // offset: (() {
      //   switch (order) {
      //     case 0:
      //       return const Offset(0, 0);
      //     case 1:
      //       return const Offset(0, -20);
      //     case 2:
      //       return const Offset(0, -40);
      //     default:
      //       return const Offset(0, 0);
      //   }
      // })(),
      
      // 삼항연산자 사용
      // offset: order == 0
      //         ? const Offset(0,0)
      //         : order == 1
      //         ? const Offset(0, -20)
      //         : const Offset(0, -40),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
