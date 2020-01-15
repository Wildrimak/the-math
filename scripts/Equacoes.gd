extends Label
class_name Equacao

var a
var b

func _ready():
	randomize()

func new():
	self.a = sorteia_a()
	self.b = sorteia_b()
	return self

func get_equacao():
	
	var equacao = self.new()

	return equacao

func sorteia_a():
	var result = int(rand_range(-9, 9))
	result = int(rand_range(1,9)) if result == 0 else result
	return result

func sorteia_b():
	return int(rand_range(-9, 9))

func get_calcula_equacao(var equacao):
	return equacao
	
func get_str_equacao():
	return "F(x) = " + str(a)+"x + "+str(b)
	
	
