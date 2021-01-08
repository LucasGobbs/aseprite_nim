import "aseprite/stream"
import "aseprite/header"
import "aseprite/frame"
import "aseprite/chunk"

type
    aseprite_file* = object

proc open*(path: string) = 
    var str = stream.create(path)

    let head = header.read(str)
    echo head
 
    let frame = frame.read(str)
    echo frame


    let chunk1 = chunk.read(str)
    echo chunk1

    let chunk2 = chunk.read(str)
    echo chunk2

