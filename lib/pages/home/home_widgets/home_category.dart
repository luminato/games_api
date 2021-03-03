import 'package:flutter/material.dart';
import 'package:gamesapi/controllers/home_controller.dart';
import 'package:get/state_manager.dart';

class CategoryGames extends StatelessWidget {
  Widget cardCategory({String image, String category}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(6),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(category,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PermanentMarker',
                  fontSize: 20,
                )),
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
            
            Container(
              height: 300,
              width: double.infinity,
              child: GridView.count(
                childAspectRatio: 17/8,
                crossAxisCount: 2,
                children: [
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
              ),
            ),
            
            // cardCategory(
            //   image: 'https://png.pngtree.com/thumb_back/fw800/back_our/20190625/ourmid/pngtree-red-flame-burning-game-banner-background-image_259947.jpg',
            //   category: 'Action'
            // ),
            // cardCategory(
            //   image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-game-volcano-advertising-background-backgroundblack-backgroundlight-spotstar-image_72467.jpg',
            //   category: 'FPS'
            // ),
            // cardCategory(
            //   image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-chinese-style-ink-watercolor-green-bamboo-forest-simple-beautiful-background-forestchinese-image_75063.jpg',
            //   category: 'Adventury'
            // ),
            // cardCategory(
            //   image: 'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-world-cup-passion-vs-cool-background-design-cup-backgroundgame-scenestadiumfootball-image_71585.jpg',
            //   category: 'Sports'
            // ),
            // cardCategory(
            //   image: 'https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-cyberpunk-game-neon-gradient-image_17686.jpg',
            //   category: 'RPG'
            // ),
            
          ],
        );
      },
    );
  }
  
}
