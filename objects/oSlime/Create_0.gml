/// @description 

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sSlime;
aggroCheck = 0;
// Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = EnemySlimeWander;
enemyScript[ENEMYSTATE.CHASE] = EnemySlimeChase;