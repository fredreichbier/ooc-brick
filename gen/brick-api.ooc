include brick

Sound: cover {
    play: extern(sound_play) static func (arg0: Sound*, arg1: Int) -> Int
    loadRaw: extern(sound_load_raw) static func (arg0: Int, arg1: UChar*) -> Sound*
    adjustVol: extern(sound_adjust_vol) static func (arg0: Int, arg1: Int)
    halt: extern(sound_halt) static func (arg0: Int)
    loadFrom_Buffer: extern(sound_load_from_buffer) static func (arg0: Int, arg1: UChar*) -> Sound*
    adjustPan: extern(sound_adjust_pan) static func (arg0: Int, arg1: Int)
    loadFrom_Disk: extern(sound_load_from_disk) static func (arg0: Char*) -> Sound*
}

List: cover from StructList* {
    add: extern(list_add) func (arg1: Void*)
    delete: extern(list_delete) func
    find: extern(list_find) func (arg1: Void*) -> Int
    length: extern(list_length) func -> Int
    pop: extern(list_pop) func -> Void*
    empty: extern(list_empty) func
    prepend: extern(list_prepend) func (arg1: Void*)
    sort: extern(list_sort) func (arg1: Func)
    shift: extern(list_shift) func -> Void*
    create: extern(list_create) static func -> List
    remove: extern(list_remove) func (arg1: Void*, arg2: Int)
}

Motion: cover {
    execList: static func (arg0: List) -> Int {
        return _checkError(motion_exec_list(arg0))
    }
    execSingle: static func (arg0: Sprite) -> Int {
        return _checkError(motion_exec_single(arg0))
    }
}

IO: cover {
    readKey: extern(io_read_key) static func -> Int
    assign: extern(io_assign) static func (arg0: Int, arg1: Int, ...)
    mouse: extern(io_mouse) static func (arg0: Int, arg1: Mouse*) -> Int
    hasQuit: extern(io_has_quit) static func -> Int
    grab: extern(io_grab) static func (arg0: Int)
    fetch: extern(io_fetch) static func (arg0: Int, arg1: Input*) -> Int
    wait: extern(io_wait) static func (arg0: Int) -> Int
}

Tile: cover from StructTile* {
    setCollides: extern(tile_set_collides) func (arg1: Int)
    addFrameData: extern(tile_add_frame_data) func (arg1: Int, arg2: Int, arg3: Int, arg4: Void*, arg5: Void*) -> Int
    setPixelMaskFrom_: extern(tile_set_pixel_mask_from) func (arg1: Int, arg2: Frame)
    getCollides: func (arg1: Int*) -> Int {
        return _checkError(tile_get_collides(this, arg1))
    }
    reset: extern(tile_reset) func
    setAnimType: extern(tile_set_anim_type) func (arg1: Int)
    setPixelMask: extern(tile_set_pixel_mask) func (arg1: Int, arg2: UChar*)
    delete: extern(tile_delete) func
    create: extern(tile_create) static func -> Tile
    getAnimType: func (arg1: Int*) -> Int {
        return _checkError(tile_get_anim_type(this, arg1))
    }
    addFrame: extern(tile_add_frame) func (arg1: Frame) -> Int
    animate: extern(tile_animate) func
}

Brick: cover {
    delay: extern static func (arg0: Int) -> Int
    init: extern(init_brick) static func
    quit: extern(quit_brick) static func
}

Audio: cover {
    close: extern(audio_close) static func
    open: extern(audio_open) static func (arg0: Int) -> Int
}

Map: cover from StructMap* {
    getSize: func (arg1: Int*, arg2: Int*) -> Int {
        return _checkError(map_get_size(this, arg1, arg2))
    }
    resetTiles: extern(map_reset_tiles) func
    setTile: extern(map_set_tile) func (arg1: Int, arg2: Tile)
    setData: extern(map_set_data) func (arg1: Short*)
    delete: extern(map_delete) func
    setSingle: extern(map_set_single) func (arg1: Int, arg2: Int, arg3: Short)
    animateTiles: extern(map_animate_tiles) func
    setTileSize: extern(map_set_tile_size) func (arg1: Int, arg2: Int)
    setSize: extern(map_set_size) func (arg1: Int, arg2: Int)
    getTileSize: func (arg1: Int*, arg2: Int*) -> Int {
        return _checkError(map_get_tile_size(this, arg1, arg2))
    }
    getTile: func (arg1: Int, arg2: Tile*) -> Int {
        return _checkError(map_get_tile(this, arg1, arg2))
    }
    empty: extern(map_empty) func
    create: extern(map_create) static func -> Map
}

Layer: cover from Int {
    add: extern(layer_add) static func -> Int
    getView: func (arg1: Box*) -> Int {
        return _checkError(layer_get_view(this, arg1))
    }
    setMap: extern(layer_set_map) func (arg1: Map)
    setCamera: extern(layer_set_camera) func (arg1: Int, arg2: Int)
    getVisible: extern(layer_get_visible) func -> Int
    getSorting: extern(layer_get_sorting) func -> Int
    copy: extern(layer_copy) func -> Int
    setSpriteList: extern(layer_set_sprite_list) func (arg1: List)
    getStringList: extern(layer_get_string_list) func -> List
    adjustCamera: extern(layer_adjust_camera) func (arg1: Int, arg2: Int)
    setStringList: extern(layer_set_string_list) func (arg1: List)
    remove: extern(layer_remove) func
    getSpriteList: extern(layer_get_sprite_list) func -> List
    setView: extern(layer_set_view) func (arg1: Box*)
    getCamera: func (arg1: Int*, arg2: Int*) -> Int {
        return _checkError(layer_get_camera(this, arg1, arg2))
    }
    count: extern(layer_count) static func -> Int
    getMap: extern(layer_get_map) func -> Map
    setVisible: extern(layer_set_visible) func (arg1: Int)
    setSorting: extern(layer_set_sorting) func (arg1: Int)
    reorder: extern(layer_reorder) func (arg1: Int)
}

Sprite: cover from StructSprite* {
    delete: extern(sprite_delete) func
    setPosition: extern(sprite_set_position) func (arg1: Int, arg2: Int)
    addFrame: extern(sprite_add_frame) func (arg1: Frame) -> Int
    addSubframe: extern(sprite_add_subframe) func (arg1: Int, arg2: Frame) -> Int
    setVelocity: extern(sprite_set_velocity) func (arg1: Int, arg2: Int)
    setZHint: extern(sprite_set_z_hint) func (arg1: Int)
    getZHint: func (arg1: Int*) -> Int {
        return _checkError(sprite_get_z_hint(this, arg1))
    }
    create: extern(sprite_create) static func -> Sprite
    setFrame: extern(sprite_set_frame) func (arg1: Int)
    getVelocity: func (arg1: Int*, arg2: Int*) -> Int {
        return _checkError(sprite_get_velocity(this, arg1, arg2))
    }
    getFrame: func (arg1: Int*) -> Int {
        return _checkError(sprite_get_frame(this, arg1))
    }
    addFrameData: extern(sprite_add_frame_data) func (arg1: Int, arg2: Int, arg3: Int, arg4: Void*, arg5: Void*) -> Int
    setPixelMaskFrom_: extern(sprite_set_pixel_mask_from) func (arg1: Int, arg2: Frame)
    setCollides: extern(sprite_set_collides) func (arg1: Int)
    getPosition: func (arg1: Int*, arg2: Int*) -> Int {
        return _checkError(sprite_get_position(this, arg1, arg2))
    }
    loadProgram: extern(sprite_load_program) func (arg1: Char*) -> Int
    setPixelMask: extern(sprite_set_pixel_mask) func (arg1: Int, arg2: UChar*)
    getCollides: extern(sprite_get_collides) func (arg1: Int*) -> Int
    setBoundingBox: extern(sprite_set_bounding_box) func (arg1: Int, arg2: Box*)
    copy: extern(sprite_copy) func -> Sprite
}

Render: cover {
    setBgColor: extern(render_set_bg_color) static func (arg0: Char, arg1: Char, arg2: Char)
    setOverdraw: extern(render_set_overdraw) static func (arg0: Int, arg1: Int)
    toDisk: extern(render_to_disk) static func (arg0: Char*) -> Int
    setBgFill: extern(render_set_bg_fill) static func (arg0: Int)
    display: extern(render_display) static func
}

Song: cover {
    setPosition: extern(song_set_position) static func (arg0: Int)
    resume: extern(song_resume) static func
    playFrom_Buffer: extern(song_play_from_buffer) static func (arg0: Int, arg1: UChar*, arg2: Int)
    playFrom_Disk: extern(song_play_from_disk) static func (arg0: Char*, arg1: Int)
    pause: extern(song_pause) static func
    adjustVol: extern(song_adjust_vol) static func (arg0: Int)
    stop: extern(song_stop) static func (arg0: Int)
}

Frame: cover from StructFrame* {
    setMaskFrom_: extern(frame_set_mask_from) func (arg1: Frame)
    delete: extern(frame_delete) func
    convert: extern(frame_convert) func (arg1: Int, arg2: Void*) -> Frame
    create: extern(frame_create) static func (arg0: Int, arg1: Int, arg2: Int, arg3: Void*, arg4: Void*) -> Frame
    fromDisk: extern(frame_from_disk) static func (arg0: Char*, arg1: Color*) -> Frame
    fromBuffer: extern(frame_from_buffer) static func (arg0: Int, arg1: UChar*, arg2: Color*) -> Frame
    copy: extern(frame_copy) func -> Frame
    setMask: extern(frame_set_mask) func (arg1: UChar*)
    slice: extern(frame_slice) func (arg1: Int, arg2: Int, arg3: Int, arg4: Int) -> Frame
}

Inspect: cover {
    lineOfSight: extern(inspect_line_of_sight) static func (arg0: Map, arg1: Sprite, arg2: Int, arg3: Int, arg4: Int, arg5: Sprite) -> Int
    obscuredTiles: extern(inspect_obscured_tiles) static func (arg0: Map, arg1: Sprite, arg2: MapFragment*)
    nearPoint: extern(inspect_near_point) static func (arg0: List, arg1: Int, arg2: Int, arg3: Int) -> List
    adjacentTiles: extern(inspect_adjacent_tiles) static func (arg0: Map, arg1: Sprite, arg2: Int, arg3: MapFragment*)
    inFrame: extern(inspect_in_frame) static func (arg0: List, arg1: Box*) -> List
}

Collision: cover {
    withMap: extern(collision_with_map) static func (arg0: Sprite, arg1: Map, arg2: Int, arg3: MapCollision*)
    withSprites: extern(collision_with_sprites) static func (arg0: Sprite, arg1: List, arg2: Int, arg3: SpriteCollision*) -> Int
}

Graphics: cover {
    close: extern(graphics_close) static func
    open: static func (arg0: Int, arg1: Int, arg2: Int, arg3: Int, arg4: Int) -> Int {
        return _checkError(graphics_open(arg0, arg1, arg2, arg3, arg4))
    }
    info: extern(graphics_info) static func (arg0: Int*, arg1: Int*) -> Int
}

BString: cover from StructString_* {
    setText: extern(string_set_text) func (arg1: Char*)
    setFont: extern(string_set_font) func (arg1: Char*)
    delete: extern(string_delete) func
    create: extern(string_create) static func -> BString
    setPosition: extern(string_set_position) func (arg1: Int, arg2: Int)
}

Font: cover {
    fromBuffer: extern(font_from_buffer) static func (arg0: Char*, arg1: Int, arg2: UChar*, arg3: Color*)
    fromDisk: extern(font_from_disk) static func (arg0: Char*, arg1: Char*, arg2: Color*)
    add: extern(font_add) static func (arg0: Char*, arg1: Int, arg2: Int, arg3: UChar*, arg4: Color*)
}

Event: cover {
    message: extern(event_message) static func (arg0: Int, arg1: Int)
    add: extern(event_add) static func (arg0: Int, arg1: Int, arg2: Event, arg3: Void*) -> Int
}

Failure: class extends Exception {
    init: func ~withCode (code: String) {
        super(code)
    }
}

_checkError: func (code: Int) -> Int {
    if(code != 0) {
        Failure new(match(code) {
            case ERR_CANT_REOPEN => "ERR_CANT_REOPEN"
            case ERR_BAD_MODE => "ERR_BAD_MODE"
            case ERR_BAD_FILE => "ERR_BAD_FILE"
            case ERR_SDL_FAILED => "ERR_SDL_FAILED"
            case ERR_SDL_VIDEO_FAILED => "ERR_SDL_VIDEO_FAILED"
            case ERR_SDL_MIXER_FAILED => "ERR_SDL_MIXER_FAILED"
            case ERR_BAD_FRAME_TYPE => "ERR_BAD_FRAME_TYPE"
            case ERR_INVALID_FILE => "ERR_INVALID_FILE"
            case ERR_BAD_INST => "ERR_BAD_INST"
            case ERR_BAD_VAR => "ERR_BAD_VAR"
            case ERR_BAD_ARG => "ERR_BAD_ARG"
            case ERR_TOO_LONG => "ERR_TOO_LONG"
            case ERR_BAD_LIST => "ERR_BAD_LIST"
            case ERR_BAD_INST_BC => "ERR_BAD_INST_BC"
            case ERR_BAD_ARG_BC => "ERR_BAD_ARG_BC"
            case => code toString()
        }) throw()
    }
    return code
}
StructList: cover from struct list {
    head: extern Element*
    tail: extern Element*
}

StructConvolution: cover from struct convolution {
    kw: extern Int
    kh: extern Int
    kernel: extern Char*
    divisor: extern Int
    offset: extern Int
}

StructPoint: cover from struct point {
    x: extern Int
    y: extern Int
}

StructVector: cover from struct vector {
    x: extern Int
    y: extern Int
}

StructSound: cover from struct sound {
    wave: extern Void*
    buf: extern UChar*
}

StructInput: cover from struct input {
    axis: extern Int*
    hat: extern Vector*
    button: extern Int*
    space: extern Int
    tab: extern Int
    sel: extern Int
    pause: extern Int
    esc: extern Int
}

StructString_: cover from struct string {
    font: extern Char*
    x: extern Int
    y: extern Int
    text: extern Char*
}

StructSpriteCollision: cover from struct sprite_collision {
    mode: extern Int
    dir: extern Vector
    stop: extern Vector
    target: extern Void*
}

StructSprite: cover from struct sprite {
    frameCt: extern(frame_ct) Int
    curFrame: extern(cur_frame) Int
    collides: extern Int
    zHint: extern(z_hint) Int
    pos: extern Point
    vel: extern Vector
    frames: extern StructFramestack*
    bound: extern Box*
    bc: extern Box
    motion: extern Mcp
}

StructFramestack: cover from struct framestack {
    len: extern Int
    stack: extern Frame*
}

StructFont: cover from struct font {
    name: extern Char*
    w: extern Int
    h: extern Int
    chars: extern StructFrame**
}

StructMouse: cover from struct mouse {
    x: extern Int
    y: extern Int
    button: extern Int*
}

StructFrame: cover from struct frame {
    w: extern Int
    h: extern Int
    tag: extern Int
    data: extern Void*
    aux: extern Void*
    scratch: extern UChar*
    mask: extern UChar*
}

StructElement: cover from struct element {
    data: extern Void*
    next: extern StructElement*
    prev: extern StructElement*
}

StructIterator: cover from struct iterator {
    myL: extern(my_l) List
    myEl: extern(my_el) Element*
    ct: extern Int
}

StructMap: cover from struct map {
    tw: extern Int
    th: extern Int
    tiles: extern Tile*
    w: extern Int
    h: extern Int
    data: extern Short*
}

StructMcp: cover from struct mcp {
    code: extern UChar*
    tick: extern Int
}

StructDimensions: cover from struct dimensions {
    w: extern Int
    h: extern Int
}

StructTile: cover from struct tile {
    animType: extern(anim_type) Int
    frameCt: extern(frame_ct) Int
    curFrame: extern(cur_frame) Int
    collides: extern Int
    frames: extern StructFrame**
}

StructMapFragment: cover from struct map_fragment {
    w: extern Int
    h: extern Int
    tiles: extern Short*
}

StructBox: cover from struct box {
    x1: extern Int
    y1: extern Int
    x2: extern Int
    y2: extern Int
}

StructMapCollision: cover from struct map_collision {
    mode: extern Int
    stop: extern Vector
    go: extern Vector
}

StructColor: cover from struct color {
    r: extern UChar
    g: extern UChar
    b: extern UChar
    a: extern UChar
}

Convolution: cover from StructConvolution

Point: cover from StructPoint

Vector: cover from StructVector

Input: cover from StructInput

String_: cover from StructString_

SpriteCollision: cover from StructSpriteCollision

Mouse: cover from StructMouse

Element: cover from StructElement

Iterator: cover from StructIterator

Mcp: cover from StructMcp

Dimensions: cover from StructDimensions

MapFragment: cover from StructMapFragment

Box: cover from StructBox

MapCollision: cover from StructMapCollision

Color: cover from StructColor

layer_get_camera: extern func (arg0: Int, arg1: Int*, arg2: Int*) -> Int
tile_get_collides: extern func (arg0: Tile, arg1: Int*) -> Int
map_get_tile: extern func (arg0: Map, arg1: Int, arg2: Tile*) -> Int
map_get_tile_size: extern func (arg0: Map, arg1: Int*, arg2: Int*) -> Int
tile_get_anim_type: extern func (arg0: Tile, arg1: Int*) -> Int
map_get_size: extern func (arg0: Map, arg1: Int*, arg2: Int*) -> Int
motion_exec_list: extern func (arg0: List) -> Int
graphics_open: extern func (arg0: Int, arg1: Int, arg2: Int, arg3: Int, arg4: Int) -> Int
layer_get_view: extern func (arg0: Int, arg1: Box*) -> Int
sprite_get_position: extern func (arg0: Sprite, arg1: Int*, arg2: Int*) -> Int
sprite_get_z_hint: extern func (arg0: Sprite, arg1: Int*) -> Int
sprite_get_frame: extern func (arg0: Sprite, arg1: Int*) -> Int
sprite_get_velocity: extern func (arg0: Sprite, arg1: Int*, arg2: Int*) -> Int
motion_exec_single: extern func (arg0: Sprite) -> Int

