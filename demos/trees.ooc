import math/Random
import structs/ArrayList
import brick/Brick

SCREEN_W := 384
SCREEN_H := 240
LAYER_CT := 5
TREE_CT := 4

limit: func (min, val, max: Int) -> Int { val < min ? min : ( (val > max) ? max : val ) }

main: func {
    Brick init()

    s: Sprite
    // load all trees and the mountain.
    trees := ["tree1.png", "tree2.png", "tree3.png", "tree4.png"] as ArrayList<String>
    tree_amt := [0, 12, 24, 60, 120] as ArrayList<Int>

    sprites := ArrayList<Sprite> new()
    for(i in 0..TREE_CT) {
        tree := Sprite create()
        sprites add(tree)
        tree addFrame(Frame fromDisk(trees[i], null) convert(FRAME_LT, null))
    }
    mountain := Sprite create()
    mountain addFrame(Frame fromDisk("mountain1.png", null) convert(FRAME_LT, null))
    sprites add(mountain)
    // layers
    layers := ArrayList<Layer> new()
    for(i in 0..LAYER_CT) {
        layer := Layer add()
        layers add(layer)
        if(!i) {
            s = mountain copy()
            s setPosition(0, 80)
            layer getSpriteList() add(s)
        } else {
            for(j in 0..tree_amt[i]) {
                s = sprites[Random randRange(0, 3)] copy()
                s setPosition(Random randRange(20, i*600), Random randRange(i*10 + 90, i*20 + 120))
                layer getSpriteList() add(s)
            }
        }
    }

    Graphics open(GRAPHICS_ACCEL, SCREEN_W, SCREEN_H, 0, 2)
    
    cx := 0
    cy := 0
    io: Input

    while(true) {
        IO fetch(0, io&)
        cx += io hat[0] x
        cy += io hat[0] y
        cx = limit(20, cx, 200)
        layers[0] setCamera(cx/2, 0)
        for(i in 1..LAYER_CT)
            layers[i] setCamera(cx * (i+1), 0)

        Render display()
        Brick delay(50)
        if(io esc || IO hasQuit())
            break
    }
}
