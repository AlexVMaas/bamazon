var inquirer = require("inquirer")
var mysql = require("mysql")

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,
	user: "root",
	password: "root",
	database: "bamazonDB"
})

listProducts()

function listProducts() {
	connection.query("SELECT * FROM products", function(err, res) {
		console.log("Product ID | Name | Price")
		for (var i = 0; i<res.length; i++) {
			console.log(res[i].id + "          | " + res[i].product_name + " | $" + res[i].price)
		}
		console.log("-----------------------")
		askIdQuant()
	})
}

function askIdQuant() {
	inquirer.prompt([
		{
		name: "chooseId",
		message: "Which item would you like to buy? Please enter ID",
		},
		{
		name: "quantity",
		message: "How many would you like?"
		}
	]).then(function(answerIdQuant){
		var index = answerIdQuant.chooseId - 1;
		connection.query("SELECT * FROM products", function(err, res) { 
			if (err) throw err;
			if (answerIdQuant.quantity > res[index].stock_quantity) {
				console.log("Sorry that's too many")
			} else {
				var price = answerIdQuant.quantity * res[index].price
				console.log(answerIdQuant.quantity + " will cost you $" + price)
				connection.query("UPDATE products SET ? WHERE ?", 
						[{
							stock_quantity: res[index].stock_quantity - answerIdQuant.quantity
						},
						{
							id: answerIdQuant.chooseId
						}],
					function(err, res) {
						if (err) throw err;
					}
				)	
			}
			connection.end()
		})
	})
}


