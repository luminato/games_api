import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:get/state_manager.dart';

class CategoryGames extends StatelessWidget {
  Widget cardCategory({String image, String category}) {
    return Card(
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: Image.network(
              image,
              height: 60,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(category,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PermanentMarker',
                        fontSize: 20,
                      )),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'genero',
      initState: (_) {},
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Category',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            cardCategory(
              image: 'https://png.pngtree.com/thumb_back/fw800/back_our/20190625/ourmid/pngtree-red-flame-burning-game-banner-background-image_259947.jpg',
              category: 'Action'
            ),
            cardCategory(
              image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-game-volcano-advertising-background-backgroundblack-backgroundlight-spotstar-image_72467.jpg',
              category: 'FPS'
            ),
            cardCategory(
              image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-chinese-style-ink-watercolor-green-bamboo-forest-simple-beautiful-background-forestchinese-image_75063.jpg',
              category: 'Adventury'
            ),
            cardCategory(
              image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-world-cup-passion-vs-cool-background-design-cup-backgroundgame-scenestadiumfootball-image_71585.jpg',
              category: 'Sports'
            ),
            cardCategory(
              image: 'https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-cyberpunk-game-neon-gradient-image_17686.jpg',
              category: 'RPG'
            ),
            
          ],
        );
      },
    );
  }
}
