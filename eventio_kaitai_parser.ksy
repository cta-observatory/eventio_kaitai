meta:
  id: eventio_kaitai_parser
  title: EventIO file
  license: CC0-1.0
  ks-version: 0.1
  endian: le
  bit-endian: le
doc: |
  EventIO data format as produced by the CORSIKA iact extension and sim_telarray
doc-ref:
  - https://www.mpi-hd.mpg.de/hfm/~bernlohr/sim_telarray/Documentation/eventio_en.pdf
seq:
  - id: objects
    type: top_level_object
    repeat: eos
    
types:
  object:
    seq:
      - id: header
        type: object_header
      - id: subobjects
        if: header.container == true
        type: objects
        size: header.length
      - id: payload
        if: header.container == false
        size: header.length
  
  objects:
    seq:
      - id: objects
        type: object
        repeat: eos
  
  object_header:
    seq:
      - id: type
        type: u2
      - id: user_bit
        type: b1
      - id: extended_length
        type: b1
      - id: reserved_type
        type: b2
      - id: version
        type: b12
      - id: id
        type: s4
      - id: length
        type: b30
      - id: container
        type: b1
      - id: reserved_length
        type: b1
  
  top_level_object:
    seq:
      - id: sync_marker
        contents: [0x37, 0x8a, 0x1f, 0xd4]
      - id: object
        type: object
