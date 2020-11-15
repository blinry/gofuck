sgf = IO.read("rxj-gokifu-18460725-Gennan_Inseki-Honinbo_Shusaku.sgf")

instructions = {
    "B" => {
        1 => ">",
        2 => "+",
        3 => ",",
        4 => "[",
    },
    "W" => {
        1 => "<",
        2 => "-",
        3 => ".",
        4 => "]",
    }
}

puts sgf.scan(/[BW]\[..\]/).map { |move|
    color = move[0]
    location = move[2..3].split("").map{|c| c.ord - "a".ord}
    [color, location]
}.each_cons(2).map { |a, b|
    distance = (a[1][0] - b[1][0]).abs + (a[1][1] - b[1][1]).abs
    instructions[b[0]][distance]
}.compact.join("")
