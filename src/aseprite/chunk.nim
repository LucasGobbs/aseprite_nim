import "stream"
import "utils"
type
    AsepriteFileChunk* = object
        size: DWORD
        chunk_type: WORD
        data: seq[BYTE]


proc read*(stream: var AsepriteStream): AsepriteFileChunk = 
    var chunk = AsepriteFileChunk()
    stream.read_dword(chunk.size.addr)
    stream.read_word(chunk.chunk_type.addr)

    echo chunk

    case chunk.chunk_type:
        of 0x0004:
            echo 'a'
        of 0x0011:
            echo 'b'
        of 0x2004:
            echo 'c'
        of 0x2005:
            echo 'd'
        of 0x2006:
            echo 'e'
        of 0x2007:
            echo 'f'
        of 0x2016:
            echo 'g'
        of 0x2017:
            echo 'h'
        of 0x2018:
            echo 'i'
        of 0x2019:
            echo 'j'
        of 0x2020:
            echo 'k'
        of 0x2022:
            echo 'l'
        else: 
            echo 'm'

    return chunk