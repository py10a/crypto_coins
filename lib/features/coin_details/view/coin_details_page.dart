import 'package:crypto_coins_app/theme/theme.dart'; // Assuming your theme colors are here
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinDetailsPage extends StatefulWidget {
  const CoinDetailsPage({super.key});

  @override
  State<CoinDetailsPage> createState() => _CoinDetailsPageState();
}

class _CoinDetailsPageState extends State<CoinDetailsPage> {
  late final String coinName;
  late final String coinImageUrl;
  late final Map<String, dynamic> priceData;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args != null && args is Map) {
      final coinMap = args as Map<String, dynamic>;
      coinName = coinMap['coin_name'] as String;
      coinImageUrl = coinMap['coin_image_url'] as String;

      // Assuming coin_prices is Map<String, dynamic> and contains a USD key
      final prices = coinMap['coin_prices'] as Map<String, dynamic>;
      if (prices.containsKey('USD') && prices['USD'] is Map) {
        priceData = Map<String, dynamic>.from(prices['USD'] as Map);
      } else {
        // Handle cases where USD data might be missing or not in expected format
        priceData = {};
      }
      _isLoading = false;
    } else {
      // Handle cases where arguments are not as expected
      coinName = 'Error';
      coinImageUrl = ''; // Provide a fallback or error image URL
      priceData = {};
      _isLoading = false;
    }
  }

  // Helper to safely get string values, removing potential HTML tags
  String _getStringValue(dynamic value) {
    if (value == null) return 'N/A';
    String strValue = value.toString();
    // Basic HTML tag removal, can be improved if more complex HTML is present
    strValue = strValue.replaceAll(RegExp(r'<[^>]*>'), '');
    return strValue.trim().isEmpty ? 'N/A' : strValue.trim();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (priceData.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(coinName)),
        body: const Center(child: Text('Price data not available.')),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final change24HourRaw = _getStringValue(priceData['CHANGE24HOUR']);
    // Remove currency symbols and other non-numeric characters for parsing
    final change24HourCleaned =
        change24HourRaw.replaceAll(RegExp(r'[^0-9\.\-]'), '');
    final change24HourValue = double.tryParse(change24HourCleaned) ?? 0.0;
    final changeColor = change24HourValue >= 0 ? kToxicGreen : kErrorRed;

    final changePct24HourRaw = _getStringValue(priceData['CHANGEPCT24HOUR']);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 280,
            backgroundColor: colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                coinName,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              background: Hero(
                tag: coinName,
                child: Image.network(
                  coinImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      color: kErrorRed,
                      size: 100),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Price Overview Card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: colorScheme.surface,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_getStringValue(priceData['FROMSYMBOL'])} / ${_getStringValue(priceData['TOSYMBOL'])}',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getStringValue(priceData['PRICE']),
                          style: textTheme.headlineLarge?.copyWith(
                              color: kToxicGreen, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$change24HourRaw ($changePct24HourRaw%) Today',
                          style: textTheme.titleSmall
                              ?.copyWith(color: changeColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Market Stats',
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                // Market Statistics Card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: colorScheme.surface,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.8,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 16,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildStatTile(
                            'Market Cap', _getStringValue(priceData['MKTCAP'])),
                        _buildStatTile(
                            'Supply', _getStringValue(priceData['SUPPLY'])),
                        _buildStatTile('Volume (24H)',
                            _getStringValue(priceData['VOLUME24HOURTO'])),
                        _buildStatTile('Open (Day)',
                            _getStringValue(priceData['OPENDAY'])),
                        _buildStatTile('High (Day)',
                            _getStringValue(priceData['HIGHDAY'])),
                        _buildStatTile(
                            'Low (Day)', _getStringValue(priceData['LOWDAY'])),
                        _buildStatTile('Last Market',
                            _getStringValue(priceData['LASTMARKET'])),
                        _buildStatTile('Last Update',
                            _getStringValue(priceData['LASTUPDATE'])),
                      ],
                    ),
                  ),
                ),

                // You can add more cards or sections here, e.g., for charts
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatTile(String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
              color: textTheme.bodyMedium?.color?.withValues(alpha: 0.7)),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
