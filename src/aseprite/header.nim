import "stream"
import "utils"
type
    AsepriteFileHeader* = object
        file_size: DWORD 
        magic_number: WORD 
        frames*: WORD
        width: WORD
        height: WORD
        color_depth: WORD 
        flags: DWORD
        speed: WORD
        # jump 2 DWORD
        pallete_entry: BYTE
        # jump 3 bytes
        number_color: WORD
        pixel_width: BYTE
        pixel_height: BYTE
        x_pos: SHORT
        y_pos: SHORT
        grid_width: WORD
        grid_height: WORD
        # jump 84 bytes


proc read*(stream: var AsepriteStream): AsepriteFileHeader = 
    var header = AsepriteFileHeader()

  
    stream.read_dword(header.file_size.addr)

    stream.read_word(header.magic_number.addr)
    if ( header.magic_number != 0xA5E0 ):
        echo "Magic Number in Header is: ", header.magic_number, ", Wich does not match to: ", 0xA5E0
        quit(0)
    stream.read_word(header.frames.addr)
    stream.read_word(header.width.addr)
    stream.read_word(header.height.addr)
    stream.read_word(header.color_depth.addr)
    stream.read_dword(header.flags.addr)
    stream.read_word(header.speed.addr)
    stream.jump(2 * DWORD.sizeof())
    stream.read_byte(header.pallete_entry.addr)
    stream.jump(3 * BYTE.sizeof())
    stream.read_word(header.number_color.addr)
    stream.read_byte(header.pixel_width.addr)
    stream.read_byte(header.pixel_height.addr)
    stream.read_short(header.x_pos.addr)
    stream.read_short(header.y_pos.addr)
    stream.read_word(header.grid_width.addr)
    stream.read_word(header.grid_height.addr)
    stream.jump(84 * BYTE.sizeof())
    return header