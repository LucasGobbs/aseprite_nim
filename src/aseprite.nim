import "aseprite/stream"
import "aseprite/header"
import "aseprite/frame"
import "aseprite/chunk"

type
    aseprite_file* = object

proc open*(path: string) = 
    var str = stream.create(path)

    let parsed_header = header.read(str)
    echo "Header", parsed_header

    # For each frame 
    let frame_quantity: uint32 = parsed_header.frames - 1
    for i in 0 .. frame_quantity:

        let parsed_frame = frame.read(str)
        echo "Frame ", i, ": ", parsed_frame

        # For each chunk
        var chunk_quantity: uint32
        if parsed_frame.new_field == 0: 
            chunk_quantity = uint32(parsed_frame.old_field) - 1 
        else: 
            chunk_quantity = parsed_frame.new_field - 1

        for j in 0 .. chunk_quantity:
            let parsed_chunk = chunk.read(str)
            echo "Chunk ", j, ": ", parsed_chunk


    let chunk1 = chunk.read(str)
    echo chunk1

    let chunk2 = chunk.read(str)
    echo chunk2

