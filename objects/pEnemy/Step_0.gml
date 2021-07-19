/// @description Execute state machine
if(!global.gamePaused) {
	if(enemyScript[state] != -1) {
		script_execute(enemyScript[state]);	
	}
	depth = -bbox_bottom;
}

if(enemyTouchAttack && place_meeting(x, y, oPlayer)) {
	EnemyHurtPlayer(enemyTouchDamage, point_direction(x, y, oPlayer.x, oPlayer.y), enemyTouchForce);
}