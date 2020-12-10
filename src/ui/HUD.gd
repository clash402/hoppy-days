extends CanvasLayer

# PROPERTIES
onready var CoinCount = $Margin/HBox/Banner/HBox/HBox1/CoinCount
onready var LifeCount = $Margin/HBox/Banner/HBox/HBox2/LifeCount


# CUSTOM
func update_lives_label(lives_left):
	LifeCount.text = str(lives_left)


func update_coin_label(coins):
	CoinCount.text = str(coins)
	
