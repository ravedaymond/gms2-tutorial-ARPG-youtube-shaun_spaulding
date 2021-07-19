/// @description Draw user interface
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
// Separate full number of hearts and fractional parts of heart
_playerHealth -= _playerHealthFrac;

for(var i = 1; i <= _playerHealthMax; i++) {
	// Returns T/F as 1/0. Then use that as image index for full heart (0) or empty heart (1).
	var _imageIndex = (i > _playerHealth);
	
	if(i == _playerHealth+1) {
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);
	}
	
	draw_sprite(sHealth, _imageIndex, 8+((i-1)*16), 8);
	
}

