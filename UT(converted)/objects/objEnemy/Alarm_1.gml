if objHeart.alive
{
	var flavorText = irandom_range(0, 4)
	switch(flavorText)
	{
		case 0:
			objHeart.menuDial = [
@"* Aaron is admiring his own
  muscles."]
			  break;
		case 1:
			objHeart.menuDial = [
@"* Smells like a mussel farm."]
			  break;
		case 2:
			objHeart.menuDial = [
@"* Smells like an underwater 
  barnyard."]
			  break;
		case 3:
			objHeart.menuDial = [
@"* Aaron is splashing you 
  playfully."]
			  break;
		case 4:
			objHeart.menuDial = [
@"* Aaron is sweating bullets.
* Literally."]
			  break;
	}
	endEnemyTurn()
}