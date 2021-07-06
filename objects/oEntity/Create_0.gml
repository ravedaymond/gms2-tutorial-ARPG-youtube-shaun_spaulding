/// @description Set entity defaults
image_speed = entityImageSpeed;
z = entityStartingZ;

#region Shaders
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
#endregion