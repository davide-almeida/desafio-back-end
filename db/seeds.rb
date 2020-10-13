# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "---------------"
puts "Seed - Start"
puts "---------------"

# New Users generate
puts "Add Users - Start"
User.create(email: 'user@user.com.br', password: '123456', password_confirmation: '123456', status: true)
User.create(email: 'davide.jhonatan@gmail.com', password: '123456', password_confirmation: '123456', status: true)
puts "Add Users - End"

# New Drops generate
# Drop.create(title: "Teste1", user_id: 2)

# New TransactionRules generate
puts "Add TransactionRules - Start"
TransactionRule.create(kind: 1, description: "Débito", source: "Entrada", operator: "+")
TransactionRule.create(kind: 2, description: "Boleto", source: "Saída", operator: "-")
TransactionRule.create(kind: 3, description: "Financiamento", source: "Saída", operator: "-")
TransactionRule.create(kind: 4, description: "Crédito", source: "Entrada", operator: "+")
TransactionRule.create(kind: 5, description: "Recebimento Empréstimo", source: "Entrada", operator: "+")
TransactionRule.create(kind: 6, description: "Vendas", source: "Entrada", operator: "+")
TransactionRule.create(kind: 7, description: "Recebimento TED", source: "Entrada", operator: "+")
TransactionRule.create(kind: 8, description: "Recebimento DOC", source: "Entrada", operator: "+")
TransactionRule.create(kind: 9, description: "Aluguel", source: "Saída", operator: "-")
puts "Add TransactionRules - End"

puts "---------------"
puts "Seed - End"
puts "---------------"