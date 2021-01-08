import "stream"
import "utils"
type
    ChunkType* = enum
        OldPallete = 0x004,
        OldPallete2 = 0x0011,
        Layer = 0x2004,
        Cel = 0x2005,
        CelExtra = 0x2006,
        ColorProfille = 0x2007,
        Mask = 0x2016,
        Path = 0x2017,
        Tags = 0x2018,
        Pallete = 0x2019,
        UserData = 0x2020,
        Slice = 0x2022
    
    AsepriteFileChunk* = object
        size: DWORD
        chunk_type: ChunkType
        data: seq[BYTE]


proc read*(stream: var AsepriteStream): AsepriteFileChunk = 
    var chunk = AsepriteFileChunk()
    stream.read_dword(chunk.size.addr)
    stream.read_word(chunk.chunk_type.addr)

    case chunk.chunk_type:
        of OldPallete:
            echo 'a'
        of OldPallete2:
            echo 'b'
        of Layer:
            echo 'c'
        of Cel:
            echo 'd'
        of CelExtra:
            echo 'e'
        of ColorProfille:
            echo 'f'
        of Mask:
            echo 'g'
        of Path:
            echo 'h'
        of Tags:
            echo 'i'
        of Pallete:
            echo 'j'
        of UserData:
            echo 'k'
        of Slice:
            echo 'l'
        else: 
            echo "Error"

    return chunk