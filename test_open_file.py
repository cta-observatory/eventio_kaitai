from eventio_kaitai_parser import EventioKaitaiParser
from os import path
from itertools import zip_longest

TESTFILE = "test_files/corsika_iact/one_shower.dat"


def test_can_open_file():
    EventioKaitaiParser.from_file(TESTFILE)


def test_file_has_objects_at_expected_position():
    expected = [
        (16, 1096),
        (1128, 448),
        (1592, 20),
        (1628, 1096),
        (2740, 16),
        (2772, 6136),
        (8924, 1096),
        (10036, 16),
    ]
    f = EventioKaitaiParser.from_file(TESTFILE)

    for o, (addr, size) in zip_longest(f.objects, expected):
        # assert o.object.header.content_address == addr
        assert o.object.header.length == size


def test_file_has_correct_types():
    f = EventioKaitaiParser.from_file(TESTFILE)
    types = [o.object.header.type for o in f.objects]

    assert types == [1200, 1212, 1201, 1202, 1203, 1204, 1209, 1210]
