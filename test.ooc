import brick/Brick

main: func {
    Brick init()
    a := Graphics open(1, 640, 480, 0, 0)
    a toString() println()
    while(1) { Render display() }
    Brick quit()
}
