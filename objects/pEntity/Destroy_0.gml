/// @description Manage entity fragments
if(entityFragmentCount > 0) {
	// Creates fragment array with a size of count and each item being entityFragments
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x, y, fragmentArray);
}