# holo:xray/sample — macro dx,dz; sample block at probe+offset, classify, write pixel
$execute as @e[tag=xray_probe,limit=1] at @s positioned ~$(dx) ~ ~$(dz) run function holo:xray/classify
