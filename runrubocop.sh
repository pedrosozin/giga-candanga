# roda rubo cop e tbm o best practices e os abre no navegador
rubocop -R --format html -o tmp/rubocop.html
rails_best_practices -f html --output-file tmp/best_practices_output.html
xdg-open tmp/rubocop.html
xdg-open tmp/best_practices_output.html
