

def keyfinder (object, key)
  array = key.split('/')
  object.dig(*array)
end

puts keyfinder({ "a" => { "b" => { "c" => "d" }}}, "a/b/c")
# d
puts keyfinder({ "x" => { "y" => { "z" => "a" }}}, "x/y/z")
# a
puts keyfinder({ "a" => { "b" => { "c" => "d" }}}, "a/b")
# {"c"=>"d"}
