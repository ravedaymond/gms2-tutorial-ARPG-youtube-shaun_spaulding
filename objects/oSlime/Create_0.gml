/// @description 

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sSlime;

// Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = EnemySlimeWander;