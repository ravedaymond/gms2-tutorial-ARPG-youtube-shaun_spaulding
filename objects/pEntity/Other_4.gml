/// @description Get Room Collision Map
/// For non-persistant objects, works same as if in Create event.
/// For persistant objects, ensures new room collision map is accounted for.
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));