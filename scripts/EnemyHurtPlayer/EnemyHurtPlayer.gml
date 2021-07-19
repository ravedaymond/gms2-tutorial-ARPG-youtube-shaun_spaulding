function EnemyHurtPlayer(_damage, _direction, _force){
	if(oPlayer.invulnerable <= 0) {
		global.playerHealth = max(0, global.playerHealth-_damage);
		
		if(global.playerHealth > 0) {
			with(oPlayer) {
				state = PlayerStateBonk;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				ScreenShake(2, 10);
				flashShader = shRedFlash;
				flash = 0.7
				invulnerable = 60;
			}
		} else {
			// Kill the player	
		}
	}
}