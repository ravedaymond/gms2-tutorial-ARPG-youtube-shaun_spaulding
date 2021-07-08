/// @description Set entity defaults
image_speed = 0;
z = 0;

lifted = false;
thrown = false;

#region Shaders
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
#endregion