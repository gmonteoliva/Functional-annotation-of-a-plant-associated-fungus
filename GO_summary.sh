#Input
database="go-database.obo"
GO_terms="GO_codigos.txt"

# Read GO IDs extracted into an array
readarray -t ids_go < "$GO_terms"

# Search for matches in the database file
while IFS= read -r linea; do
    if [[ $linea =~ ^id:\ GO: ]]; then
        go_id=$(echo "$linea" | awk -F': ' '{print $2}')
        for id in "${ids_go[@]}"; do
            if [[ $go_id == $id ]]; then
                echo "Match found: $linea"
            fi
        done
    fi
done < "$database"

