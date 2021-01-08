import streams
type
    AsepriteStream* = object
        handle*: FileStream


proc create*(path: string): AsepriteStream = 
    return AsepriteStream(
        handle: newFileStream(path, fmRead)
    )

proc read_byte*(stream: var AsepriteStream, address: pointer) = 
    discard stream.handle.readData(address, uint8.sizeof())

proc read_word*(stream: var AsepriteStream, address: pointer) = 
    discard stream.handle.readData(address, uint16.sizeof())

proc read_dword*(stream: var AsepriteStream, address: pointer) = 
    discard stream.handle.readData(address, uint32.sizeof())

proc read_short*(stream: var AsepriteStream, address: pointer) = 
    discard stream.handle.readData(address, int16.sizeof())

proc read_long*(stream: var AsepriteStream, address: pointer) = 
    discard stream.handle.readData(address, int32.sizeof())

proc jump*(stream: var AsepriteStream, amount: int32) = 
    let current_pos = stream.handle.getPosition()
    stream.handle.setPosition(current_pos + amount)