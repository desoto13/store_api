grocery =  Store.create(name: "grocery store", url: "https://grocery.com")
product1 = grocery.products.create(name: "ice candy", sku: "RF243F", inventory_quantity: 20)
product2 = grocery.products.create(name: "ice cream", sku: "RF244F", inventory_quantity: 30)
product3 = grocery.products.create(name: "ice pop", sku: "RF243G", inventory_quantity: 40)
product4 = grocery.products.create(name: "ice", sku: "RF245F", inventory_quantity: 50)

