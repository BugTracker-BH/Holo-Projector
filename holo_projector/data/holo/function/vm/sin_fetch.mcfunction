# holo:vm/sin_fetch — macro t=angle; replaces t with sin(angle)*1000
$data modify storage holo:vm t set from storage holo:vm sin_lut[$(t)]
