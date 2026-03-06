import 'package:flutter/material.dart';

class CountryDetailPage extends StatelessWidget {

  final String name;
  final String capital;
  final String population;
  final String continent;
  final String currency;
  final String language;
  final String image;
  final String desc;

  CountryDetailPage({
  required this.name,
  required this.capital,
  required this.population,
  required this.continent,
  required this.currency,
  required this.language,
  required this.image,
  required this.desc,
});

@override
Widget build(BuildContext context) {

  // _buildInfoCard 메서드를 클래스 안에 만드세요
  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.indigo[100]!,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.indigo, size:28),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      title: Text(name),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          // 상단 이미지 + 그라데이션
          Stack(
            children: [
              // 국기 이미지
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              // 그라데이션 오버레이
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 아래에 정보 영역이 올 자리
          // Column의 children에 추가 (이미지 아래)
          SizedBox(height: 20),

// 나라 이름
          Text(
            name,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.indigo[900],
            ),
          ),

          SizedBox(height: 8),

// 대륙 태그
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.indigo[200]!,
                width: 1,
              ),
            ),
            child: Text(
              continent,
              style: TextStyle(
                fontSize: 14,
                color: Colors.indigo[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Column의 children에 추가
          SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // 첫 번째 줄: 수도 + 인구
                Row(
                  children: [
                    _buildInfoCard(Icons.location_city, '수도', capital),
                    _buildInfoCard(Icons.people, '인구', population),
                  ],
                ),
                // 두 번째 줄: 화폐 + 언어
                Row(
                  children: [
                    _buildInfoCard(Icons.monetization_on, '화폐', currency),
                    _buildInfoCard(Icons.translate, '언어', language),
                  ],
                ),
              ],
            ),
          ),

          // Column의 children에 추가
          SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // 제목 + 양쪽 구분선
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.indigo[200])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '나라 소개',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo[700],
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.indigo[200])),
                  ],
                ),

                SizedBox(height: 16),

                // 설명 텍스트
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[700],
                    height: 0,
                  ),
                ),
              ],
            ),
          ),

          // Column의 children에 추가
          SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$name에 대해 더 알아보기!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(Icons.public),
                label: Text(
                  '더 알아보기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 3,
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

        ],
      ),
    ),
  );
}
}