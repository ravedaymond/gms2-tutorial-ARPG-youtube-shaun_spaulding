// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Drop items at specified (x,y) coordinate
/// @arg x
/// @arg y
/// @arg items[]
function DropItems(_x, _y, _items){
	
	var _itemCount = array_length(_items);
	if(_itemCount > 1) {
		
		var _anglePerItem = 360/_itemCount;
		var _angle = random(360);
		
		for(var i=0; i<_itemCount; i++) {
			with(instance_create_layer(_x, _y, "Instances", _items[i])) {
				direction = _angle;
				// Base speed + Larger circle with more items + not quite so perfect circle
				spd = 0.75+(_itemCount*0.1)+random(0.1);
			}
			_angle += _anglePerItem;
		}
		
	} else instance_create_layer(_x, _y, "Instances", _items[0]);
	
	
	
	
}