# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Categoria.create([{nome: "Participante"}, {nome: "Parceira"}, {nome:"Fornecedor"}])

RepasseCategoria.create([{nome: "Contrato"}, {nome: "Convênio"}, {nome: "Acordo de Cooperação Técnica"}, {nome: "Contrato de Gestão via MCTIC"},{nome: "Contrato de Gestão via RNP"},{nome: "Contrato de Gestão via MEC"}])

ResponsavelTipo.create([{descricao: "Dirigente Máximo"},{descricao: "Representante do Comitê Técnico"},{descricao: "Representante do Comitê Gestor"}])

Usuario.create({nome: "Admin(Trocar em primeiro login, senha 123456)", email: "admin@admin.com", password: "123456", ativo: true, telefone: "999999999"})
