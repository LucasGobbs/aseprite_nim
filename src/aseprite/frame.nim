import "stream"
import "utils"
type
    AsepriteFileFrame* = object
        bytes: DWORD
        magic_number: WORD
        old_field*: WORD
        frame_duration: WORD
        #jump 2 bytes
        new_field*: DWORD

proc read*(stream: var AsepriteStream): AsepriteFileFrame = 
    var frame = AsepriteFileFrame()

    stream.read_dword(frame.bytes.addr)
    stream.read_word(frame.magic_number.addr)
    if ( frame.magic_number != 0xF1FA ):
        echo "Magic Number in Frame is: ", frame.magic_number, ", Wich does not match to: ", 0xF1FA
        quit(0)
    stream.read_word(frame.old_field.addr)
    stream.read_word(frame.frame_duration.addr)
    stream.jump(2 * BYTE.sizeof())
    stream.read_dword(frame.new_field.addr)

    return frame