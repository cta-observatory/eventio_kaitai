from eventio_kaitai_parser import EventioKaitaiParser


def get_payload_address(obj):
    """Get address in file of payload or subobjects

    Get the address of the first byte of the payload or
    the subobject contained in an object.
    Needs the `--read-pos` flag in `kaitai-struct-compiler`

    Parameters
    ----------
    obj : Object or TopLevelObject

    Returns
    -------
    start : int
        byte address
    """
    field = "subobjects" if "subobjects" in obj._debug else "payload"
    return obj._debug[field]["start"]
