import 'package:flutter/material.dart';

class BloodRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildBloodRequestCard(
              bloodType: "O-",
              location: "Morang",
              patientName: "Sajja Parsai",
              requiredDetails:
                  "2 Pint required on 2081-08-24 at 10:55 PM on Birat Teaching Hospital",
              caseDetails: "Accident...emergency case...urgently required",
              contactName: "Basanta Siwakoti",
              phoneNumber: "9816309540",
              postDate: "2024-12-09 10:34 PM",
              requestId: "NBDOP2575",
            ),
            _buildBloodRequestCard(
              bloodType: "O+",
              location: "Lalitpur",
              patientName: "Safal Bhusal",
              requiredDetails:
                  "2 Pint required on 2024-12-07 at 01:06 AM on Om Hospital",
              caseDetails: "Accident",
              contactName: "Surakshya Bhusal",
              phoneNumber: "9749762905",
              postDate: "2024-12-09 10:34 PM",
              requestId: "NBDOP2576",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodRequestCard({
    required String bloodType,
    required String location,
    required String patientName,
    required String requiredDetails,
    required String caseDetails,
    required String contactName,
    required String phoneNumber,
    required String postDate,
    required String requestId,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Required Blood: $bloodType",
                  style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Text("Patient: $patientName",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("Required: $requiredDetails"),
            const SizedBox(height: 5),
            Text("Case: $caseDetails"),
            const SizedBox(height: 5),
            Text("Contact: $contactName"),
            const SizedBox(height: 5),
            Text("Phone: $phoneNumber"),
            const Divider(),
            Row(
              children: [
                Text("Post Date: $postDate",
                    style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                Text("ID: $requestId",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement call functionality
                  },
                  icon: const Icon(Icons.call),
                  label: const Text("Call"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement share functionality
                  },
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
