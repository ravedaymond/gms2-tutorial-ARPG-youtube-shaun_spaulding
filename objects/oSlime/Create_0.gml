/// @description 

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;
sprHurt = sSlimeHurt;
sprDie = sSlimeDie;

aggroCheck = 0;
// Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = EnemySlimeWander;
enemyScript[ENEMYSTATE.CHASE] = EnemySlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = EnemySlimeAttack;
enemyScript[ENEMYSTATE.HURT] = EnemySlimeHurt;
enemyScript[ENEMYSTATE.DIE] = EnemySlimeDie;